#!/usr/bin/env python3
"""Generate a professional OG banner image (1200x630) for SmartTemp."""

from PIL import Image, ImageDraw, ImageFont, ImageFilter
import math

# Dimensions
WIDTH = 1200
HEIGHT = 630

# Brand colors
PRIMARY_BLUE = (41, 182, 246)      # #29b6f6
DARK_BLUE = (2, 136, 209)         # #0288d1
DARK_TEXT = (45, 52, 54)          # #2d3436
GRAY_TEXT = (99, 110, 114)        # #636e72
GREEN_ACCENT = (0, 184, 148)     # #00b894
WHITE = (255, 255, 255)

# Create the base image
img = Image.new('RGBA', (WIDTH, HEIGHT), WHITE)
draw = ImageDraw.Draw(img)

# Draw gradient background (dark blue to primary blue, diagonal)
for y in range(HEIGHT):
    for x in range(WIDTH):
        # Diagonal gradient factor
        factor = (x / WIDTH * 0.6 + y / HEIGHT * 0.4)
        r = int(DARK_BLUE[0] + (PRIMARY_BLUE[0] - DARK_BLUE[0]) * factor)
        g = int(DARK_BLUE[1] + (PRIMARY_BLUE[1] - DARK_BLUE[1]) * factor)
        b = int(DARK_BLUE[2] + (PRIMARY_BLUE[2] - DARK_BLUE[2]) * factor)
        img.putpixel((x, y), (r, g, b, 255))

# Add subtle geometric pattern overlay (circles/arcs for tech feel)
overlay = Image.new('RGBA', (WIDTH, HEIGHT), (0, 0, 0, 0))
overlay_draw = ImageDraw.Draw(overlay)

# Draw decorative circles
circles = [
    (900, -80, 400, 15),   # top-right large
    (1100, 500, 300, 10),  # bottom-right
    (-100, 400, 350, 12),  # bottom-left
    (600, -150, 250, 8),   # top-center
]
for cx, cy, radius, alpha in circles:
    overlay_draw.ellipse(
        [cx - radius, cy - radius, cx + radius, cy + radius],
        outline=(255, 255, 255, alpha),
        width=2
    )

# Add a frosted glass card area for the content
card_x = 60
card_y = 80
card_w = WIDTH - 120
card_h = HEIGHT - 160
card_overlay = Image.new('RGBA', (WIDTH, HEIGHT), (0, 0, 0, 0))
card_draw = ImageDraw.Draw(card_overlay)

# Semi-transparent white card with rounded corners effect
card_draw.rounded_rectangle(
    [card_x, card_y, card_x + card_w, card_y + card_h],
    radius=24,
    fill=(255, 255, 255, 45)
)
# Subtle border
card_draw.rounded_rectangle(
    [card_x, card_y, card_x + card_w, card_y + card_h],
    radius=24,
    outline=(255, 255, 255, 80),
    width=2
)

img = Image.alpha_composite(img, overlay)
img = Image.alpha_composite(img, card_overlay)

# Reload draw context after compositing
draw = ImageDraw.Draw(img)

# Load fonts
font_bold = ImageFont.truetype('/usr/share/fonts/google-noto/NotoSans-Bold.ttf', 72)
font_black = ImageFont.truetype('/usr/share/fonts/google-noto/NotoSans-Black.ttf', 72)
font_medium = ImageFont.truetype('/usr/share/fonts/google-noto/NotoSans-Medium.ttf', 32)
font_regular = ImageFont.truetype('/usr/share/fonts/google-noto/NotoSans-Regular.ttf', 24)
font_badge = ImageFont.truetype('/usr/share/fonts/google-noto/NotoSans-SemiBold.ttf', 20)

# Load and place logo
logo = Image.open('/projects/sandbox/Presupuesto/icon-512.png').convert('RGBA')
logo_size = 140
logo = logo.resize((logo_size, logo_size), Image.LANCZOS)

# Position logo on the left side of content area
logo_x = card_x + 60
logo_y = (HEIGHT - logo_size) // 2 - 20
img.paste(logo, (logo_x, logo_y), logo)

# Text area starts after the logo
text_x = logo_x + logo_size + 50
text_y_start = card_y + 80

# Draw "SmartTemp" title
title_text = "SmartTemp"
draw = ImageDraw.Draw(img)

# Title with slight shadow for depth
shadow_offset = 2
draw.text((text_x + shadow_offset, text_y_start + shadow_offset), title_text,
          font=font_black, fill=(0, 0, 0, 40))
draw.text((text_x, text_y_start), title_text,
          font=font_black, fill=WHITE)

# Subtitle
subtitle_y = text_y_start + 90
subtitle_text = "Monitoreo Inteligente de Temperatura"
draw.text((text_x, subtitle_y), subtitle_text,
          font=font_medium, fill=(255, 255, 255, 230))

# Separator line
sep_y = subtitle_y + 55
draw.line([(text_x, sep_y), (text_x + 400, sep_y)],
          fill=(255, 255, 255, 100), width=2)

# Badges/keywords
badges = ["Cloud Propio", "Alertas WhatsApp", "Asistente IA", "Trazabilidad"]
badge_y = sep_y + 25
badge_x = text_x
badge_padding_x = 16
badge_padding_y = 8
badge_spacing = 12

for badge_text in badges:
    bbox = font_badge.getbbox(badge_text)
    text_width = bbox[2] - bbox[0]
    text_height = bbox[3] - bbox[1]

    badge_w = text_width + badge_padding_x * 2
    badge_h = text_height + badge_padding_y * 2

    # Check if badge fits in current row
    if badge_x + badge_w > card_x + card_w - 60:
        badge_x = text_x
        badge_y += badge_h + badge_spacing

    # Draw badge text only (no background)
    draw.text(
        (badge_x + badge_padding_x, badge_y + badge_padding_y - 2),
        badge_text,
        font=font_badge,
        fill=WHITE
    )

    badge_x += badge_w + badge_spacing

# Add "Propuesta Comercial" at the bottom right
bottom_text = "Propuesta Comercial"
font_bottom = ImageFont.truetype('/usr/share/fonts/google-noto/NotoSans-Medium.ttf', 22)
bottom_bbox = font_bottom.getbbox(bottom_text)
bottom_text_w = bottom_bbox[2] - bottom_bbox[0]
draw.text(
    (card_x + card_w - bottom_text_w - 40, card_y + card_h - 50),
    bottom_text,
    font=font_bottom,
    fill=(255, 255, 255, 180)
)

# Convert to RGB for PNG save (no alpha)
final = img.convert('RGB')
final.save('/projects/sandbox/Presupuesto/og-banner.png', 'PNG', quality=95)
print("OG banner saved: og-banner.png (1200x630)")
