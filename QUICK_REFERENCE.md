# 🚀 Quick Reference - IDM-VTON GitHub Actions

## ⚡ Quick Start

1. **Go to Actions tab** → **IDM-VTON Virtual Try-On** → **Run workflow**
2. **Enter image URLs** (person + garment)
3. **Click Run workflow**
4. **Wait 15-20 minutes**
5. **Download from Artifacts**

## 🖼️ Test URLs

```
Person: https://raw.githubusercontent.com/yisol/IDM-VTON/main/example/human/00013_00.jpg
Garment: https://raw.githubusercontent.com/yisol/IDM-VTON/main/example/cloth/00034_00.jpg
```

## ⚙️ Parameter Quick Guide

| Setting | Fast | Balanced | High Quality |
|---------|------|----------|--------------|
| Steps | 10 | 20 | 30 |
| Guidance | 1.5 | 2.0 | 3.0 |
| Time | 10min | 20min | 30min |

## 📋 Categories

- `upper_body` - T-shirts, shirts, jackets
- `lower_body` - Pants, jeans, shorts  
- `dresses` - Dresses, gowns

## 🔧 Common Issues

| Problem | Solution |
|---------|----------|
| Image download fails | Check URL is direct link to image |
| Workflow timeout | Reduce steps to 10-15 |
| Poor quality | Increase steps to 25-30 |
| No artifacts | Check workflow completed successfully |

## 💡 Pro Tips

- ✅ Use front-facing person photos
- ✅ Clean garment backgrounds work best
- ✅ Test with examples first
- ✅ Save successful parameter combinations
- ✅ Use descriptive seeds (dates work well)

## 🔗 Quick Links

- [Full Documentation](README.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md)
- [Usage Guide](docs/USAGE.md)
- [Examples](examples/)

## 🎯 Ready to Start?

**Actions Tab → IDM-VTON Virtual Try-On → Run workflow** 🚀
