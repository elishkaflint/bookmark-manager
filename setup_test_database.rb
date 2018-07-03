require 'pg'

test_connection = PG.connect(dbname: 'bookmark_manager_test')
test_connection.exec("TRUNCATE TABLE bookmarks")
