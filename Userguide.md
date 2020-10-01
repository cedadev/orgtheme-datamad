# Orgtheme User Guide: Process to build a new distribution

**BOOTSWATCH_THEME: FLATLY**

## Setup

1. install [node](https://nodejs.org/en/)
2. make sure npm is updated

    ```bash
    npm install -g npm
    ``` 

3. Download the repository: 

    ```bash
    git clone https://github.com/thomaspark/bootswatch.git
    ```

## Generate the new orgtheme
1. Move to bootswatch repository
    
    ```bash
    cd bootswatch
    ```
    
2. Install dependencies
    
    ```bash
    npm install
    ```
3. Make sure you have grunt installed and available at the command line.
    
    ```bash
    npm install -g grunt-cli
    ``` 
4. Copy the ceda customisation to the correct theme directory. 

    Copy the _variables.scss file from your clone of orgtheme_ceda_serv to the theme (flatly) directory.

5. Build the orgtheme.
    
    In the `dist` directory of the bootswatch repo run:
    ```bash
    grunt swatch:[<theme_name>]
    ```
## Copy the new assets to the orgtheme

Return to your orgtheme_ceda_serv repo and run the fetch_assets.sh script.
```bash
./fetch_assets.sh <path_to_top_level_bootswatch_repo>
```   

This will pull all the relevant files into this repository.

## Update relevant places
1. Update the version number in the orgtheme found in:

    `orgtheme-ceda-serv/orgtheme_ceda_serv/__init__.py`

2. Update the layout.html to refelect the future position of the new assets.

    Make sure to update the 
    [layout](https://github.com/cedadev/fwtheme-django-ceda-serv/tree/master/fwtheme_django_ceda_serv/templates/fwtheme_django) 
    to reflect the future position of the new assets on the artefacts server.

3. Commit and tag version

## Push the new orgtheme to SVN
This will get picked up by the artefacts server and publish the new orgtheme assets.

```bash
svn co http://team.ceda.ac.uk/svn/artefacts/themes/orgtheme_ceda_serv/
svn cp <old_version> <new_version>
```

Copy the new contents of ortheme_ceda_serv/static/orgtheme from the orgtheme repo to your new directory in the svn repo.

Upload the new version to svn.

    `svn commit -m "message"`

