## Disable the Use of .min.css Files in wp-admin/css/ [wp_default_styles/cms/wp-includes/script-loader.php]

```shell
$suffix = SCRIPT_DEBUG ? '' : '.min';
```
=> Fix
```shell
$suffix = '';
```
Reference: 
- [_print_styles]/[cms/wp-includes/script-loader.php]

## Go
