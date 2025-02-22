<?php
function _admin_bar_wp_logo( $wp_admin_bar ) {
    
    $about_url = admin_url( 'about.php' ); 

    $wp_logo_menu_args = array(
        'id'    => 'wp-logo',
        'title' => '<span class="ab-icon" aria-hidden="true"></span><span class="screen-reader-text">' .
            __( 'About WordPress' ) .
            '</span>',
        'href'  => $about_url,
        'meta'  => array(
            'menu_title' => __( 'About WordPress' ),
        ),
    );

    if ( ! $about_url ) {
        $wp_logo_menu_args['meta'] = array(
            'tabindex' => 0,
        );
    }

    $wp_admin_bar->add_node( $wp_logo_menu_args );
}

add_action( 'admin_bar_menu', '_admin_bar_wp_logo', 11 );

