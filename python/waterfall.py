import matplotlib.pyplot as plt
import numpy as np
import re
import sys

def parse_startup_log(file_path):
    with open(file_path, 'r') as f:
        data = f.read()
    
    lines = data.strip().split('\n')
    
    # Initialize lists for our data
    timestamps = []
    durations = []
    labels = []
    colors = []
    
    # Process each line
    for line in lines:
        # Skip empty lines
        if not line.strip():
            continue
            
        # Skip the first line (NVIM STARTING) for waterfall logic
        if "--- NVIM STARTING ---" in line:
            continue
            
        # Extract timestamp and duration using regex to be more robust
        # This matches patterns like "000.142  000.140: event init" or "001.277  000.044  000.044: require('vim.shared')"
        match = re.match(r'(\d+\.\d+)\s+(\d+\.\d+)(?:\s+\d+\.\d+)?: (.+)', line)
        
        if not match:
            print(f"Warning: Could not parse line: {line}")
            continue
        
        timestamp = float(match.group(1))
        duration = float(match.group(2))
        label = match.group(3).strip()
        
        timestamps.append(timestamp)
        durations.append(duration)
        labels.append(label)
        
        # Add color variation based on component type
        if "require" in label:
            colors.append('#3498db')  # blue for require statements
        elif "init" in label:
            colors.append('#e74c3c')  # red for init operations
        else:
            colors.append('#2ecc71')  # green for other operations
    
    return timestamps, durations, labels, colors

def create_waterfall_chart(timestamps, durations, labels, colors):
    # Create figure
    plt.figure(figsize=(12, 8))
    
    # Create a waterfall chart
    bottom = np.zeros(len(durations))
    for i in range(len(durations)):
        if i > 0:
            bottom[i] = timestamps[i] - durations[i]
    
    # Plot bars
    bars = plt.bar(range(len(durations)), durations, bottom=bottom, color=colors, width=0.6)
    
    # Add total time bar at the end
    total_time = timestamps[-1]
    plt.bar(len(durations), 0.0, bottom=total_time, color='gray', width=0.6, 
            label=f'Total: {total_time:.3f}s')
    
    # Customize the plot
    plt.grid(axis='y', linestyle='--', alpha=0.7)
    plt.xticks(range(len(labels)), labels, rotation=45, ha='right', fontsize=8)
    plt.title('Neovim Startup Time Waterfall Analysis', fontsize=16)
    plt.ylabel('Time (seconds)', fontsize=12)
    
    # Add duration text on bars
    for i, bar in enumerate(bars):
        height = bar.get_height()
        if height >= 0.03:  # Only show text for bars that are tall enough
            plt.text(bar.get_x() + bar.get_width()/2., bar.get_y() + height/2,
                    f'{height:.3f}s', ha='center', va='center', color='white', fontsize=8)
    
    # Add legend for color coding
    plt.plot([], [], color='#3498db', label='Require Operations')
    plt.plot([], [], color='#e74c3c', label='Init Operations')
    plt.plot([], [], color='#2ecc71', label='Other Operations')
    plt.legend(loc='upper left')
    
    # Adjust layout
    plt.tight_layout()
    
    return plt

def main():
    if len(sys.argv) != 2:
        print(f"Usage: python {sys.argv[0]} <startup_log_file>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    
    try:
        timestamps, durations, labels, colors = parse_startup_log(file_path)
        if not timestamps:
            print("Error: No valid data found in the log file.")
            sys.exit(1)
            
        plt = create_waterfall_chart(timestamps, durations, labels, colors)
        
        # Save the figure
        output_file = 'neovim_startup_waterfall.svg'
        plt.savefig(output_file, dpi=1000)
        print(f"Chart saved as {output_file}")
        
        # Show the figure
        plt.show()
        
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
