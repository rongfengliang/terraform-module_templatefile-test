postgresql['enable'] = false
gitlab_rails['db_adapter'] = "postgresql"
gitlab_rails['db_encoding'] = "unicode"
gitlab_rails['db_database'] = "${gitlab_dbname}"
gitlab_rails['db_pool'] = 10
gitlab_rails['db_username'] = "${pg_username}"
gitlab_rails['db_password'] = "${pg_password}"
gitlab_rails['db_host'] = "${pg_host}"
gitlab_rails['db_port'] = ${pg_port}

redis['enable'] = false
gitlab_rails['redis_host'] = "${redis_host}"
gitlab_rails['redis_port'] = ${redis_port}
gitlab_rails['redis_password'] = "${redis_password}"
