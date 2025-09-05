<!-- <?php

// define('DB_NAME',     getenv('WORDPRESS_DB_NAME'));
// define('DB_USER',     getenv('WORDPRESS_DB_USER'));
// define('DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD'));
// define('DB_HOST',     getenv('WORDPRESS_DB_HOST'));
// define('DB_CHARSET',  'utf8mb4');
// define('DB_COLLATE',  '');
?> -->

<!-- <?php

// define('DB_NAME',  'wp_db');
// define('DB_USER',  'wp_user'  );
// define('DB_PASSWORD', 'wp_pass');
// define('DB_HOST',  'mariadb:3306');
// define('DB_CHARSET',  'utf8mb4');
// define('DB_COLLATE',  '');
?> -->

<?php

define('DB_NAME',     getenv('WORDPRESS_DB_NAME'));
define('DB_USER',     getenv('WORDPRESS_DB_USER'));
define('DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD'));
define('DB_HOST',     getenv('WORDPRESS_DB_HOST'));
define('DB_CHARSET',  'utf8mb4');
define('DB_COLLATE',  '');

/** Authentication Unique Keys and Salts. */
// define('AUTH_KEY',         'put your unique phrase here');
// define('SECURE_AUTH_KEY',  'put your unique phrase here');
// define('LOGGED_IN_KEY',    'put your unique phrase here');
// define('NONCE_KEY',        'put your unique phrase here');
// define('AUTH_SALT',        'put your unique phrase here');
// define('SECURE_AUTH_SALT', 'put your unique phrase here');
// define('LOGGED_IN_SALT',   'put your unique phrase here');
// define('NONCE_SALT',       'put your unique phrase here');

/** WordPress database table prefix. */
$table_prefix = 'wp_';

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') ) {
    define('ABSPATH', __DIR__ . '/');
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
