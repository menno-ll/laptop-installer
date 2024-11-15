<?php

namespace Valet\Drivers\Custom;

use Valet\Drivers\BasicValetDriver;

class WordPressValetDriver extends BasicValetDriver {

    /**
     * @var string The public web directory, if deeper under the root directory
     */
    protected $public_dir = '';

     /**
     * Determine if the driver serves the request.
     */
    public function serves(string $sitePath, string $siteName, string $uri): bool
    {
        return file_exists($sitePath.'/wp-config.php') || file_exists($sitePath.'/wp-config-sample.php');
    }

    /**
     * Determine if the incoming request is for a static file.
     *
     * @param  string $sitePath
     * @param  string $siteName
     * @param  string $uri
     * @return string|false
     */
    public function isStaticFile(string $sitePath, string $siteName, string $uri) {
        $uri = $this->rewriteMultisite($sitePath, $uri);
        $sitePath = $this->realSitePath($sitePath);

        if ($this->isActualFile($staticFilePath = $sitePath . $uri)) {
            return $staticFilePath;
        }

        return false;
    }

    /**
     * Get the fully resolved path to the application's front controller.
     *
     * @param  string $sitePath
     * @param  string $siteName
     * @param  string $uri
     * @return string
     */
    public function frontControllerPath(string $sitePath, string $siteName, string $uri): string {
        $this->forceTrailingSlash($uri);
        
        $uri = $this->rewriteMultisite($sitePath, $uri);
        $sitePath = $this->realSitePath($sitePath);

        return parent::frontControllerPath(
            $sitePath,
            $siteName,
            $this->forceTrailingSlash($uri)
        );
    }

    /**
     * Translate the site path to the actual public directory
     *
     * @param $sitePath
     * @return string
     */
    protected function realSitePath(string $sitePath): string {
        if ($this->public_dir) {
            $sitePath .= $this->public_dir;
        }

        return $sitePath;
    }

    /**
     * Imitate the rewrite rules for a multisite .htaccess
     *
     * @param $sitePath
     * @param $uri
     * @return string
     */
    protected function rewriteMultisite( string $sitePath, string $uri ): string {

        if ( strpos( file_get_contents($sitePath . '/wp-config.php'), 'MULTISITE') !== false ) {
            if (preg_match('/^(.*)?(\/wp-(content|admin|includes).*)/', $uri, $matches)) {
                //RewriteRule ^([_0-9a-zA-Z-]+/)?(wp-(content|admin|includes).*) $2 [L]
                $uri = $matches[2];
            } elseif (preg_match('/^(.*)?(\/.*\.php)$/', $uri, $matches)) {
                //RewriteRule ^([_0-9a-zA-Z-]+/)?(.*\.php)$ $2 [L]
                $uri = $matches[2];
            }
        }
        return $uri;
    }

    /**
     * Redirect to uri with trailing slash.
     */
    private function forceTrailingSlash($uri): ?string
    {
        if (substr($uri, -1 * strlen('/wp-admin')) == '/wp-admin') {
            header('Location: '.$uri.'/');
            exit;
        }

        return $uri;
    }
}
