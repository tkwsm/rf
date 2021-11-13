require "test_helper"

class DbpathsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dbpath = dbpaths(:one)
  end

  test "should get index" do
    get dbpaths_url
    assert_response :success
  end

  test "should get new" do
    get new_dbpath_url
    assert_response :success
  end

  test "should create dbpath" do
    assert_difference('Dbpath.count') do
      post dbpaths_url, params: { dbpath: { abbreviation: @dbpath.abbreviation, db_path: @dbpath.db_path, project_id: @dbpath.project_id, sequence_type: @dbpath.sequence_type } }
    end

    assert_redirected_to dbpath_url(Dbpath.last)
  end

  test "should show dbpath" do
    get dbpath_url(@dbpath)
    assert_response :success
  end

  test "should get edit" do
    get edit_dbpath_url(@dbpath)
    assert_response :success
  end

  test "should update dbpath" do
    patch dbpath_url(@dbpath), params: { dbpath: { abbreviation: @dbpath.abbreviation, db_path: @dbpath.db_path, project_id: @dbpath.project_id, sequence_type: @dbpath.sequence_type } }
    assert_redirected_to dbpath_url(@dbpath)
  end

  test "should destroy dbpath" do
    assert_difference('Dbpath.count', -1) do
      delete dbpath_url(@dbpath)
    end

    assert_redirected_to dbpaths_url
  end
end
