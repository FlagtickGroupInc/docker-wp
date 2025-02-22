<?php
if ( ! defined( 'ABSPATH' ) ) {
    exit; 
}
?>

<div id="wpadminbar" class="<?php echo esc_attr( $class ); ?>">
    <?php if ( ! is_admin() && ! did_action( 'wp_body_open' ) ) { ?>
        <a class="screen-reader-shortcut" href="#wp-toolbar" tabindex="1"><?php _e( 'Skip to toolbar' ); ?></a>
    <?php } ?>
    <div class="quicklinks" id="wp-toolbar" role="navigation" aria-label="<?php esc_attr_e( 'Toolbar' ); ?>">
        <?php
        if ( isset( $root_children ) && is_array( $root_children ) ) {
            foreach ( $root_children as $group ) {
                $this->_render_group( $group );
            }
        }
        ?>
    </div>
</div>
