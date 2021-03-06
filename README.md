# Hugo site builder Docker image

![Docker Pulls](https://img.shields.io/docker/pulls/rballan/hugobuilder?style=for-the-badge)
![Docker image stats](https://img.shields.io/docker/image-size/rballan/hugobuilder/latest?style=for-the-badge)

With this Docker image, you can build a static Hugo website **easily**.  

For build a static Hugo website, this docker image need just 2 variables to work !  

This image is based on Debian Buster and contain Hugo and Git CLI. She is designed for build an Hugo static site from defined git URL.  
  
## How to use this Docker image  

```sh
docker run --rm  -e HOST_UID=$(id -u) -e HOST_GID=$(id -g) \
                 -e HUGO_WEBSITE_REPO=<git_repo_url> \
                 -e HUGO_THEME_REPO_URL=<git_repo_url> \
                 -v <local-directory-for-generated-files>:/output \
                 rballan/hugobuilder:0.83.1
```

Where :  
*  **-e HOST_UID=$(id -u) -e HOST_GID=$(id -g)** : setting the same uid & gid on generated data than the hosts user (if non-specified they will be root:root)
* **-e HUGO_WEBSITE_REPO=<git_repo_url>** : specify the URL of your Hugo repository 
* **-e HUGO_THEME_REPO_URL=<git_repo_url>** : specify the URL of the theme of your choice (you must be configure `theme = "theme"` in your config.toml file)
* **-v <local-directory-for-generated-files>:/output** : specify a local directory where the sources will be generated  

## How to test the generated website  

Simply with a standard Apache Docker image :

```sh
docker run -it --rm -v <local-directory-for-generated-files>:/usr/local/apache2/htdocs -p 8080:80 httpd
```

Then go to http://localhost:8080
