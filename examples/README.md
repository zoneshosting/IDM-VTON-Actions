# Example Images

This folder contains sample images you can use to test the virtual try-on system.

## Usage

Use these GitHub raw URLs in the workflow:

### Person Images
```
https://raw.githubusercontent.com/[YOUR-USERNAME]/IDM-VirtualTryOn/main/examples/person-1.jpg
https://raw.githubusercontent.com/[YOUR-USERNAME]/IDM-VirtualTryOn/main/examples/person-2.jpg
```

### Garment Images
```
https://raw.githubusercontent.com/[YOUR-USERNAME]/IDM-VirtualTryOn/main/examples/garment-tshirt.jpg
https://raw.githubusercontent.com/[YOUR-USERNAME]/IDM-VirtualTryOn/main/examples/garment-dress.jpg
```

## Quick Test

Try this combination for a quick test:
- Person: Use person-1.jpg
- Garment: Use garment-tshirt.jpg
- Category: upper_body
- Steps: 20
- Guidance: 2.0
- Seed: 42

## Adding Your Own Examples

1. Add your images to this folder
2. Commit and push to GitHub
3. Use the raw GitHub URLs in workflows
4. Update this README with new examples

## Image Specifications

All example images follow these guidelines:
- **Resolution**: 512x768 (person) or 512x512 (garment)
- **Format**: JPG
- **Quality**: High, well-lit photos
- **Background**: Clean, minimal backgrounds
- **Pose**: Front-facing for person images
