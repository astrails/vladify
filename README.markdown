# Prerequisites

* vlad 1.4.0

# Usage

Run:
    ./script/generate vladify

Edit:
	vim config/deploy.rb

Add to 'Rakefile':

    require 'vlad'
	require 'vlad/core'
	Vlad.load :scm => :git, :app => nil, :web => nil
