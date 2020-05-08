# Hugo site builder Docker image

With this Docker image, you can build a static Hugo website **easily**. 

This docker image is pre-configured for build my website, but you can simply override 2 environment variables to build your own Hugo static site ! 
This image is based on Debian Buster and contain Hugo and Git CLI. She is designed for build an Hugo site from his git URL. 
 
## How to use this Docker image 

```sh
docker run --rm  -e HOST_UID=$(id -u) -e HOST_GID=$(id -g) \
                 -e HUGO_WEBSITE_REPO=<git_repo_url> \
                 -e HUGO_THEME_REPO_URL=<git_repo_url> \
                 -v <local-directory-for-generated-files>:/output \
                 rballan/hugobuilder:0.69.2
```

Where : 
*  **-e HOST_UID=$(id -u) -e HOST_GID=$(id -g)** : setting the same uid & gid on generated data (if non-specified they will be root:root)
* **-e HUGO_WEBSITE_REPO=<git_repo_url>** : specify the URL of your Hugo repository 
* **-e HUGO_THEME_REPO_URL=<git_repo_url>** : specify the URL of the the of your choice (you must be configure `theme = "theme"` in your config.toml file)
* **-v <local-directory-for-generated-files>:/output** : specify a local directory where the sources will be generated 


## How to test the generated website 

Simply with a standard Apache Docker image :

```sh
docker run -it --rm -v <local-directory-for-generated-files>:/usr/local/apache2/htdocs -p 8080:80 httpd
```

Then go to http://localhost:8080
