# preview-cbz.yazi

## types

```
ya pkg add yazi-rs/plugins:types
```

## install

```
cd preview-cbz.yazi
cp -r ../preview-cbz.yazi/ ~/.config/yazi/plugins/
```

## ~/.config/yazi/yazi.toml

```
[plugin]
prepend_preloaders = [
  { url = "*.cbz", run = "preview-cbz" },
]

prepend_previewers = [
  { url = "*.cbz", run = "preview-cbz" },
]
```