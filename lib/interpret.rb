require 'best_in_place'
require 'will_paginate'
require 'lazyhash'

module Interpret
  mattr_accessor :backend
  mattr_accessor :logger
  mattr_accessor :sweeper
  mattr_accessor :parent_controller
  mattr_accessor :registered_envs
  mattr_accessor :scope
  mattr_accessor :current_user
  mattr_accessor :admin
  mattr_accessor :layout
  mattr_accessor :soft
  mattr_accessor :live_edit

  @@controller = "action_controller/base"
  @@registered_envs = [:production, :staging]
  @@scope = ""
  @@layout = "interpret_base"
  @@soft = false
  @@live_edit = false

  def self.configure
    yield self
  end
end

require 'interpret/engine' if defined? Rails

ActionView::Base.send(:include, Interpret::InterpretHelpers)
