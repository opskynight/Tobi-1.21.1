import math
import os

# ============================================
# CONFIGURATION
# ============================================
BASE_PATH = r"C:\Users\nthan\curseforge\minecraft\Instances\1.21.1 tobi\saves\E\datapacks\Tobi 1.21.1\data\tobi\function\test_spiral"
OUTPUT_FOLDER = os.path.join(BASE_PATH, "blades_clean")

os.makedirs(OUTPUT_FOLDER, exist_ok=True)

def generate_visible_blade(blade_index, angle_offset):
    """Generate VISIBLE blade - 4 particles WIDELY SPACED"""
    
    content = f"# Blade {blade_index} - {angle_offset}° offset (ULTRA CLEAN - 4 particles)\n"
    
    # 4 particles spread along a LONG spiral arm
    # Format: (scale_threshold, distance_from_center, scale_size)
    particles = [
        (20, 0.3, 1.5),   # Near center - LARGE
        (40, 0.7, 1.3),   # Quarter way
        (60, 1.1, 1.1),   # Half way
        (80, 1.5, 0.9),   # Far edge - smaller
    ]
    
    # Colors: light gray → pure black gradient
    colors = [
        [0.3, 0.3, 0.3],    # Light gray (center)
        [0.2, 0.2, 0.2],    # Medium gray
        [0.1, 0.1, 0.1],    # Dark gray
        [0.0, 0.0, 0.0],    # Pure black (edge)
    ]
    
    for i, (scale_threshold, distance, particle_scale) in enumerate(particles):
        # Calculate position with SPIRAL curve
        angle_rad = math.radians(angle_offset)
        
        # Add slight curve to make it spiral (not just a straight line)
        curve_offset = i * 8  # Degrees of curve
        curved_angle = math.radians(angle_offset + curve_offset)
        
        x = distance * math.cos(curved_angle)
        y = distance * math.sin(curved_angle)
        
        color = colors[i]
        
        content += f"execute if score @s spiral_scale matches {scale_threshold}.. at @s anchored eyes run particle minecraft:dust{{color:[{color[0]},{color[1]},{color[2]}],scale:{particle_scale}}} ^{x:.2f} ^{y:.2f} ^0.5 0 0 0 0 1 force\n"
    
    return content

# Generate all 8 blades (45° apart for clear separation)
blade_angles = [0, 45, 90, 135, 180, 225, 270, 315]

print("🎨 Generating ULTRA CLEAN Spiral Blades")
print("=" * 60)

for i, angle in enumerate(blade_angles):
    content = generate_visible_blade(i, angle)
    
    filepath = os.path.join(OUTPUT_FOLDER, f"blade_{i}.mcfunction")
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"✅ blade_{i}.mcfunction - 4 particles at {angle}°")

# Create all_blades.mcfunction
all_blades_content = "# Render all 8 clean spiral blades (32 particles total)\n"
for i in range(8):
    all_blades_content += f"function tobi:test_spiral/blades_clean/blade_{i}\n"

with open(os.path.join(OUTPUT_FOLDER, "all_blades.mcfunction"), 'w', encoding='utf-8') as f:
    f.write(all_blades_content)

print("=" * 60)
print("🎯 Created ULTRA CLEAN version!")
print(f"📊 Total particles: 4 per blade × 8 blades = 32 particles")
print(f"📁 Location: {OUTPUT_FOLDER}")
print("\n✨ Key improvements:")
print("   • WIDELY SPACED particles (0.3 → 1.5 blocks)")
print("   • CURVED arms (8° curve per particle)")
print("   • LARGE particles (1.5 → 0.9 scale)")
print("   • CLEAR separation between arms")
print("\n⚡ Next steps:")
print("   1. Run generate_rotating_blades.py")
print("   2. /reload in Minecraft")
print("   3. You should see CLEAR rotating arms!")

input("\nPress Enter to close...")