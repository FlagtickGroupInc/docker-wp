## 1
```shell
Based on 
`
cms/wp-includes/js/admin-bar.js
cms/wp-includes/class-wp-admin-bar.php
cms/wp-includes/admin-bar.php
cms/wp-settings.php
cms/wp-load.php
` How can I isolate the WordPress Admin Bar into a separate folder for testing web components in the admin site?
```

## 2
```shell
How can I isolate the files `admin-bar.php` and `class-wp-admin-bar.php` into a separate component within `wp-includes`, 
similar to a template as below
topbar
└───partial                      
    └───topbar                   
        ├───assets               
        │   ├───css              
        │   │       admin-bar.css
        │   │
        │   └───js
        │           admin-bar.js
        │
        └───inc
 ?
```
