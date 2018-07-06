require 'pg'

test_connection = PG.connect(dbname: 'bookmark_manager_test')
test_connection.exec("TRUNCATE TABLE bookmarks")
test_connection.exec("TRUNCATE TABLE comments")
test_connection.exec("TRUNCATE TABLE tags")
test_connection.exec("TRUNCATE TABLE bookmarks_tags")
