# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140920180945) do

  create_table "accounts", force: true do |t|
    t.integer  "user_id"
    t.string   "login",                  limit: 40,                      null: false
    t.string   "role",                   limit: 10,  default: "visitor", null: false
    t.integer  "karma",                              default: 20,        null: false
    t.integer  "nb_votes",                           default: 0,         null: false
    t.string   "stylesheet"
    t.string   "email",                              default: "",        null: false
    t.string   "encrypted_password",     limit: 128, default: "",        null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "preferences",                        default: 0,         null: false
    t.datetime "reset_password_sent_at"
    t.integer  "min_karma",                          default: 20
    t.integer  "max_karma",                          default: 20
    t.string   "uploaded_stylesheet"
  end

  add_index "accounts", ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true, using: :btree
  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["login"], name: "index_accounts_on_login", using: :btree
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree
  add_index "accounts", ["role"], name: "index_accounts_on_role", using: :btree
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "badges", force: true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "country"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banners", force: true do |t|
    t.string  "title"
    t.text    "content"
    t.boolean "active",  default: true
  end

  create_table "categories", force: true do |t|
    t.string   "title",      limit: 32, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "node_id"
    t.integer  "user_id"
    t.string   "state",             limit: 10,       default: "published", null: false
    t.string   "title",             limit: 160,                            null: false
    t.integer  "score",                              default: 0,           null: false
    t.boolean  "answered_to_self",                   default: false,       null: false
    t.string   "materialized_path", limit: 1022
    t.text     "body",              limit: 16777215
    t.text     "wiki_body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["node_id"], name: "index_comments_on_node_id", using: :btree
  add_index "comments", ["state", "created_at"], name: "index_comments_on_state_and_created_at", using: :btree
  add_index "comments", ["state", "materialized_path"], name: "index_comments_on_state_and_materialized_path", length: {"state"=>nil, "materialized_path"=>120}, using: :btree
  add_index "comments", ["user_id", "answered_to_self"], name: "index_comments_on_user_id_and_answered_to_self", using: :btree
  add_index "comments", ["user_id", "state", "created_at"], name: "index_comments_on_user_id_and_state_and_created_at", using: :btree

  create_table "diaries", force: true do |t|
    t.string   "title",             limit: 160,      null: false
    t.string   "cached_slug",       limit: 165
    t.integer  "owner_id"
    t.text     "body",              limit: 16777215
    t.text     "wiki_body"
    t.text     "truncated_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "converted_news_id"
  end

  add_index "diaries", ["cached_slug"], name: "index_diaries_on_cached_slug", using: :btree
  add_index "diaries", ["owner_id"], name: "index_diaries_on_owner_id", using: :btree

  create_table "forums", force: true do |t|
    t.string   "state",       limit: 10, default: "active", null: false
    t.string   "title",       limit: 32,                    null: false
    t.string   "cached_slug", limit: 32
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "forums", ["cached_slug"], name: "index_forums_on_cached_slug", using: :btree

  create_table "friend_sites", force: true do |t|
    t.string  "title"
    t.string  "url"
    t.integer "position"
  end

  add_index "friend_sites", ["position"], name: "index_friend_sites_on_position", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug"
    t.integer  "sluggable_id"
    t.string   "sluggable_type", limit: 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", unique: true, using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "links", force: true do |t|
    t.integer  "news_id",                null: false
    t.string   "title",      limit: 100, null: false
    t.string   "url",                    null: false
    t.string   "lang",       limit: 2,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "links", ["news_id"], name: "index_links_on_news_id", using: :btree

  create_table "logs", force: true do |t|
    t.integer  "account_id"
    t.string   "description"
    t.datetime "created_at"
    t.integer  "user_id"
  end

  add_index "logs", ["account_id"], name: "index_logs_on_account_id", using: :btree

  create_table "news", force: true do |t|
    t.string   "state",        limit: 10,         default: "draft", null: false
    t.string   "title",        limit: 160,                          null: false
    t.string   "cached_slug",  limit: 165
    t.integer  "moderator_id"
    t.integer  "section_id"
    t.string   "author_name",  limit: 32,                           null: false
    t.string   "author_email", limit: 64,                           null: false
    t.text     "body",         limit: 16777215
    t.text     "second_part",  limit: 2147483647
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "submitted_at"
  end

  add_index "news", ["cached_slug"], name: "index_news_on_cached_slug", using: :btree
  add_index "news", ["section_id"], name: "index_news_on_section_id", using: :btree
  add_index "news", ["state"], name: "index_news_on_state", using: :btree

  create_table "news_versions", force: true do |t|
    t.integer  "news_id"
    t.integer  "user_id"
    t.integer  "version"
    t.string   "title"
    t.text     "body",        limit: 16777215
    t.text     "second_part", limit: 16777215
    t.text     "links"
    t.datetime "created_at"
  end

  add_index "news_versions", ["created_at"], name: "index_news_versions_on_created_at", using: :btree
  add_index "news_versions", ["news_id", "version"], name: "index_news_versions_on_news_id_and_version", using: :btree
  add_index "news_versions", ["user_id", "created_at"], name: "index_news_versions_on_user_id_and_created_at", using: :btree

  create_table "nodes", force: true do |t|
    t.integer  "content_id"
    t.string   "content_type"
    t.integer  "user_id"
    t.boolean  "public",            default: true, null: false
    t.boolean  "cc_licensed",       default: true, null: false
    t.integer  "score",             default: 0,    null: false
    t.integer  "interest",          default: 0,    null: false
    t.integer  "comments_count",    default: 0,    null: false
    t.datetime "last_commented_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nodes", ["content_id", "content_type"], name: "index_nodes_on_content_id_and_content_type", unique: true, using: :btree
  add_index "nodes", ["content_type", "public", "interest"], name: "index_nodes_on_content_type_and_public_and_interest", using: :btree
  add_index "nodes", ["public", "created_at"], name: "index_nodes_on_public_and_created_at", using: :btree
  add_index "nodes", ["public", "interest"], name: "index_nodes_on_public_and_interest", using: :btree
  add_index "nodes", ["public", "last_commented_at"], name: "index_nodes_on_public_and_last_commented_at", using: :btree
  add_index "nodes", ["public", "score"], name: "index_nodes_on_public_and_score", using: :btree
  add_index "nodes", ["user_id"], name: "index_nodes_on_user_id", using: :btree

  create_table "oauth_access_grants", force: true do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: true do |t|
    t.string   "name",         null: false
    t.string   "uid",          null: false
    t.string   "secret",       null: false
    t.text     "redirect_uri", null: false
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["owner_id", "owner_type"], name: "index_oauth_applications_on_owner_id_and_owner_type", using: :btree
  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "pages", force: true do |t|
    t.string   "slug"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", using: :btree

  create_table "paragraphs", force: true do |t|
    t.integer "news_id",     null: false
    t.integer "position"
    t.boolean "second_part"
    t.text    "body"
    t.text    "wiki_body"
  end

  add_index "paragraphs", ["news_id", "second_part", "position"], name: "index_paragraphs_on_news_id_and_more", using: :btree

  create_table "poll_answers", force: true do |t|
    t.integer  "poll_id"
    t.string   "answer",     limit: 128,             null: false
    t.integer  "votes",                  default: 0, null: false
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "poll_answers", ["poll_id", "position"], name: "index_poll_answers_on_poll_id_and_position", using: :btree

  create_table "polls", force: true do |t|
    t.string   "state",             limit: 10,  default: "draft", null: false
    t.string   "title",             limit: 128,                   null: false
    t.string   "cached_slug",       limit: 128
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "wiki_explanations"
    t.text     "explanations"
  end

  add_index "polls", ["cached_slug"], name: "index_polls_on_cached_slug", using: :btree
  add_index "polls", ["state"], name: "index_polls_on_state", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "forum_id"
    t.string   "title",          limit: 160,      null: false
    t.string   "cached_slug",    limit: 165
    t.text     "body",           limit: 16777215
    t.text     "wiki_body"
    t.text     "truncated_body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["cached_slug"], name: "index_posts_on_cached_slug", using: :btree
  add_index "posts", ["forum_id"], name: "index_posts_on_forum_id", using: :btree

  create_table "responses", force: true do |t|
    t.string "title",   null: false
    t.text   "content"
  end

  create_table "sections", force: true do |t|
    t.string   "state",       limit: 10, default: "published", null: false
    t.string   "title",       limit: 32,                       null: false
    t.string   "cached_slug", limit: 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["cached_slug"], name: "index_sections_on_cached_slug", using: :btree
  add_index "sections", ["state", "title"], name: "index_sections_on_state_and_title", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "node_id"
    t.integer  "user_id"
    t.datetime "created_at"
  end

  add_index "taggings", ["created_at", "tag_id"], name: "index_taggings_on_created_at_and_tag_id", using: :btree
  add_index "taggings", ["node_id"], name: "index_taggings_on_node_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["user_id"], name: "index_taggings_on_user_id", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name",           limit: 64,                null: false
    t.integer "taggings_count",            default: 0,    null: false
    t.boolean "public",                    default: true, null: false
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree
  add_index "tags", ["public", "taggings_count"], name: "index_tags_on_public_and_taggings_count", using: :btree

  create_table "trackers", force: true do |t|
    t.string   "state",               limit: 10,       default: "opened", null: false
    t.string   "title",               limit: 100,                         null: false
    t.string   "cached_slug",         limit: 105
    t.integer  "category_id"
    t.integer  "assigned_to_user_id"
    t.text     "body",                limit: 16777215
    t.text     "wiki_body"
    t.text     "truncated_body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trackers", ["assigned_to_user_id"], name: "index_trackers_on_assigned_to_user_id", using: :btree
  add_index "trackers", ["cached_slug"], name: "index_trackers_on_cached_slug", using: :btree
  add_index "trackers", ["category_id"], name: "index_trackers_on_category_id", using: :btree
  add_index "trackers", ["state"], name: "index_trackers_on_state", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",              limit: 32
    t.string   "homesite",          limit: 100
    t.string   "jabber_id",         limit: 32
    t.string   "cached_slug",       limit: 32
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "signature"
    t.string   "custom_avatar_url"
  end

  add_index "users", ["cached_slug"], name: "index_users_on_cached_slug", using: :btree

  create_table "wiki_pages", force: true do |t|
    t.string   "title",       limit: 100,      null: false
    t.string   "cached_slug", limit: 105
    t.text     "body",        limit: 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wiki_pages", ["cached_slug"], name: "index_wiki_pages_on_cached_slug", using: :btree

  create_table "wiki_versions", force: true do |t|
    t.integer  "wiki_page_id"
    t.integer  "user_id"
    t.integer  "version"
    t.string   "message"
    t.text     "body",         limit: 16777215
    t.datetime "created_at"
  end

  add_index "wiki_versions", ["wiki_page_id", "version"], name: "index_wiki_versions_on_wiki_page_id_and_version", using: :btree

end
