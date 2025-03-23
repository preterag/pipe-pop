#!/bin/bash

# Function to display colored messages
echo_green() {
    echo -e "\033[32m$1\033[0m"
}

echo_yellow() {
    echo -e "\033[33m$1\033[0m"
}

echo_red() {
    echo -e "\033[31m$1\033[0m"
}

# Check if pop is already installed
check_installed() {
    if command -v pop &> /dev/null; then
        echo_green "✅ pop is already installed"
        return 0
    else
        echo_yellow "⚠️ pop is not installed"
        return 1
    fi
}

# Check if node is registered
check_registered() {
    if [ -f "node_info.json" ]; then
        if grep -q '"registered":true' "node_info.json"; then
            echo_green "✅ Node is already registered"
            return 0
        else
            echo_yellow "⚠️ Node is not registered"
            return 1
        fi
    else
        echo_yellow "⚠️ No node_info.json found"
        return 1
    fi
}

# Get Solana wallet
get_solana_wallet() {
    echo_yellow "\nEnter your Solana wallet public key (leave empty to skip):"
    read -p "Solana Wallet Public Key: " SOLANA_PUB_KEY
    
    if [ -n "$SOLANA_PUB_KEY" ]; then
        echo_green "✅ Solana wallet set successfully"
        echo "export SOLANA_PUB_KEY=$SOLANA_PUB_KEY" >> ~/.profile
        source ~/.profile
        # Set up wallet immediately if we have the binary
        if [ -f "/opt/pop/pop" ]; then
            echo_yellow "Setting up Solana wallet..."
            /opt/pop/pop --pubKey "$SOLANA_PUB_KEY"
        fi
    else
        echo_yellow "⚠️ No Solana wallet provided. You can add it later using: pop --pubKey <YOUR_WALLET>"
    fi
}

# Ask for referral registration
ask_referral_registration() {
    echo_yellow "\nWould you like to register your node with Surrealine's referral code?"
    echo_yellow "This will help you earn rewards through our referral program."
    read -p "Register with Surrealine referral? (Y/n): " choice
    
    case "$choice" in
        [Yy]* )
            echo_green "✅ Registering with Surrealine referral code"
            return 0
            ;;
        * )
            echo_yellow "⚠️ Skipping referral registration"
            return 1
            ;;
    esac
}

# Register node with referral code
register_with_referral() {
    echo_yellow "Registering node with referral code..."
    
    # Register with referral code
    /opt/pop/pop --signup-by-referral-route referral=140de299a927270f
    
    if [ $? -ne 0 ]; then
        echo_red "❌ Failed to register with referral code"
        exit 1
    fi
    
    echo_green "✅ Node registered with referral code successfully"
}

# Create global wrapper
create_global_wrapper() {
    echo_yellow "Creating global wrapper..."
    
    # Create wrapper script
    WRAPPER_CONTENT='#!/bin/bash

# Ensure the config file exists in home directory
if [ ! -f "$HOME/node_info.json" ]; then
    cp /etc/pop/node_info.json "$HOME/node_info.json"
fi

# Run the actual pop command with all arguments
/opt/pop/pop "$@"'
    
    echo "$WRAPPER_CONTENT" | sudo tee /usr/local/bin/pop > /dev/null
    sudo chmod +x /usr/local/bin/pop
    
    # Create system-wide config directory
    sudo mkdir -p /etc/pop
    
    # Create initial config if it doesn't exist
    if [ ! -f "/etc/pop/node_info.json" ]; then
        echo_yellow "Creating initial config..."
        sudo touch /etc/pop/node_info.json
        sudo chmod 644 /etc/pop/node_info.json
    fi
    
    echo_green "✅ Global wrapper created successfully"
}

# Download and install pop
download_pop() {
    echo_yellow "Downloading pop..."
    
    # Download the compiled binary
    curl -L -o pop "https://dl.pipecdn.app/v0.2.8/pop"
    
    if [ $? -ne 0 ]; then
        echo_red "❌ Failed to download pop"
        exit 1
    fi
    
    # Make it executable
    chmod +x pop
    
    # Create cache directory
    mkdir -p download_cache
    
    # Move to permanent location
    sudo mkdir -p /opt/pop
    sudo mv pop /opt/pop/
    
    echo_green "✅ pop binary installed successfully"
}

# Set up capabilities
setup_capabilities() {
    echo_yellow "Setting up capabilities..."
    
    # Set capabilities for the pop binary
    sudo setcap 'cap_net_bind_service=+ep' /opt/pop/pop
    
    echo_green "✅ Capabilities set successfully"
}

# Open necessary ports
setup_firewall() {
    echo_yellow "Setting up firewall rules..."
    
    # Allow necessary ports
    sudo ufw allow 8003/tcp
    sudo ufw allow 80/tcp
    sudo ufw allow 443/tcp
    sudo ufw reload
    
    echo_green "✅ Firewall rules set successfully"
}

# Perform quick test
perform_quick_test() {
    echo_yellow "\nPerforming quick test of node..."
    
    # Test egress
    echo_yellow "Testing egress connectivity..."
    pop --egress-test
    
    # Check status
    echo_yellow "Checking node status..."
    pop --status
    
    # Check points
    echo_yellow "Checking node points..."
    pop --points
    
    echo_green "✅ Quick test completed successfully!"
}

# Main installation process
main() {
    # Check if pop is installed
    if ! check_installed; then
        echo_yellow "Starting fresh installation..."
        
        # Download pop first
        download_pop
        
        # Get Solana wallet
        get_solana_wallet
        
        # Ask for referral registration
        if ask_referral_registration; then
            register_with_referral
        fi
        
        create_global_wrapper
        setup_capabilities
        setup_firewall
    else
        echo_yellow "Updating existing installation..."
        create_global_wrapper
        setup_capabilities
        setup_firewall
        
        # Check if node is registered
        if check_registered; then
            echo_yellow "\nYour node is already registered."
            read -p "Would you like to re-register with Surrealine referral? (y/N): " choice
            case "$choice" in
                [Yy]* )
                    echo_green "✅ Re-registering with Surrealine referral code"
                    register_with_referral
                    ;;
                * )
                    echo_yellow "⚠️ Skipping re-registration"
                    ;;
            esac
        fi
    fi
    
    # Handle node_info.json location
    if [ ! -f "node_info.json" ]; then
        # Check common locations
        COMMON_LOCATIONS=(
            "$HOME/.pop/node_info.json"
            "/etc/pop/node_info.json"
            "/var/lib/pop/node_info.json"
        )
        
        FOUND=0
        for location in "${COMMON_LOCATIONS[@]}"; do
            if [ -f "$location" ]; then
                echo_yellow "Found existing node_info.json at $location"
                cp "$location" ./node_info.json
                echo_green "✅ Copied node_info.json to current directory"
                FOUND=1
                break
            fi
        done
        
        if [ $FOUND -eq 0 ]; then
            echo_yellow "No existing node_info.json found. Would you like to:"
            echo_yellow "1. Create a new node_info.json here"
            echo_yellow "2. Specify a custom location"
            read -p "Enter choice (1/2): " choice
            
            case "$choice" in
                1)
                    echo_yellow "Creating default node_info.json..."
                    cat <<EOF > node_info.json
{
    "node_id": "$(uuidgen)",
    "registered": false,
    "config": {
        "cache_size": "100GB",
        "max_connections": 100,
        "location": "$(curl -s ifconfig.io/country_code)"
    },
    "stats": {
        "uptime": 0,
        "data_served": 0
    }
}
EOF
                    echo_green "✅ Created default node_info.json"
                    ;;
                2)
                    echo_yellow "Please enter the full path to your node_info.json:"
                    read -p "Path: " custom_path
                    if [ -f "$custom_path" ]; then
                        cp "$custom_path" ./node_info.json
                        echo_green "✅ Copied node_info.json from $custom_path"
                    else
                        echo_red "❌ File not found at $custom_path"
                        exit 1
                    fi
                    ;;
                *)
                    echo_red "❌ Invalid choice"
                    exit 1
                    ;;
            esac
        fi
    fi
    
    # Set up Solana wallet if provided
    if [ -n "$SOLANA_PUB_KEY" ]; then
        echo_yellow "Setting up Solana wallet..."
        pop --pubKey "$SOLANA_PUB_KEY"
    fi
    
    # Refresh the node
    echo_yellow "Refreshing node..."
    pop --refresh
    
    # Perform quick test
    echo_yellow "\nRunning quick test of your node..."
    perform_quick_test
    
    echo_green "\nInstallation/Update completed successfully!"
    echo_green "You can now run the node using: pop"
    echo_green "Your node is registered with referral code: referral=140de299a927270f"
    echo_green "\nThank you for using the Pipe POP Node Management Toolkit from Surrealine!"
    echo_green "For support and updates, visit: https://surrealine.com"
}

# Run the main installation process
main
