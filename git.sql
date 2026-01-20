use role emergepradmins;

--SECRET 
USE tasty_bytes_dbt_db.integrations;
CREATE OR REPLACE SECRET tasty_bytes_dbt_db.integrations.tb_dbt_git_secret
  TYPE = password
  USERNAME = 'your-gh-username'
  PASSWORD = 'YOUR_PERSONAL_ACCESS_TOKEN';

--API INTEGRATION to Github
CREATE OR REPLACE API INTEGRATION tb_dbt_git_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/my-github-account')
  -- Comment out the following line if your forked repository is public
  ALLOWED_AUTHENTICATION_SECRETS = (tasty_bytes_dbt_db.integrations.tb_dbt_git_secret)
  ENABLED = TRUE;


  