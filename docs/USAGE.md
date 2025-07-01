# Detailed Usage Guide

## Getting Image URLs

### Method 1: GitHub Issues (Recommended)
1. Go to your repository
2. Create a new issue
3. Drag and drop your image into the comment box
4. Copy the generated URL (starts with `https://user-images.githubusercontent.com/`)
5. Cancel the issue creation

### Method 2: Imgur
1. Go to [imgur.com](https://imgur.com)
2. Upload your image
3. Right-click the image → "Copy image address"
4. Use the direct link (ends with .jpg/.png)

### Method 3: Google Drive
1. Upload to Google Drive
2. Right-click → "Get link" → "Anyone with the link"
3. Replace `drive.google.com/file/d/FILE_ID/view` with `drive.google.com/uc?id=FILE_ID`

## Parameter Optimization

### For Different Garment Types

**T-shirts/Shirts (upper_body)**
- Category: `upper_body`
- Steps: 20-25
- Guidance: 2.0-2.5

**Pants/Jeans (lower_body)**
- Category: `lower_body`
- Steps: 25-30
- Guidance: 2.5-3.0

**Dresses**
- Category: `dresses`
- Steps: 25-35
- Guidance: 2.0-3.0

### Quality vs Speed

**Fast Processing (5-10 minutes)**
```yaml
num_inference_steps: '10'
guidance_scale: '1.5'
```

**Balanced (15-20 minutes)**
```yaml
num_inference_steps: '20'
guidance_scale: '2.0'
```

**High Quality (25-35 minutes)**
```yaml
num_inference_steps: '30'
guidance_scale: '3.0'
```

## Batch Processing Tips

### Multiple Garments on Same Person
1. Run workflow with first garment
2. Use same person URL, different garment URL
3. Keep same seed for consistency
4. Change output name to distinguish results

### Variations of Same Combination
1. Keep same image URLs
2. Change seed values (42, 123, 456, 789)
3. Compare results to find best output

## Best Practices

### Image Selection
- **Person photos**: Professional headshots or full-body photos work best
- **Garment photos**: Product photos from e-commerce sites are ideal
- **Lighting**: Consistent, bright lighting without harsh shadows
- **Background**: Plain backgrounds reduce interference

### Workflow Management
- Use descriptive seeds (like dates: 20241201)
- Download artifacts immediately (they expire after 30 days)
- Keep a log of successful parameter combinations
- Test with sample images before using important photos

## Result Interpretation

### What You Get
- `tryon_result.jpg`: The main generated image
- `person.jpg`: Your input person image
- `garment.jpg`: Your input garment image
- `metadata.json`: Parameters used and generation info
- `README.md`: Summary of the run

### Quality Assessment
The current implementation is a demonstration. For production-quality results:
- Use local GPU setup with full IDM-VTON
- Consider commercial virtual try-on services
- Experiment with different AI models

## Common Workflows

### Fashion E-commerce
1. Prepare product photos (garments)
2. Use model photos (persons)
3. Generate multiple combinations
4. Use for product listings

### Personal Styling
1. Upload your photo
2. Try different garments from online stores
3. Compare results before purchasing
4. Save favorites for reference

### Content Creation
1. Create fashion content
2. Show outfit combinations
3. Generate before/after comparisons
4. Use for social media posts
