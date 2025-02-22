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

## Build a Local WordPress Image for Use. (standing into docker/cms/ to run command using Dockerfile into /resources folder)
```shell
docker build -t <your image> . 
docker save -o <your image>.tar <your image>
```

## In a WordPress Multisite setup, each blogname represents a site within the network. 
Location: [initialize]/[cms/wp-includes/admin/partial/topbar/inc/class-topbar.php]
-> Change get_blogs_of_user() to get_sites_for_user()
-> Change get_current_blog_id() to get_active_site_id()
