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

## Fix issue with .sh file when using Git Bash commands.
```
sed -i 's/\r$//' ./docker/install_wordpress.sh
```

## Build a Local WordPress Image for Use. (standing into docker/cms/ to run command)
```shell
docker build -t <your image> . 
docker save -o <your image>.tar <your image>
```

## 
