ignore %r{^ignored/path/}, /public/
filter /\.txt$/, /.*\.zip/

group :frontend do

  guard 'livereload' do
    watch(%r{app/views/.+\.(erb|haml|slim)})
    watch(%r{app/helpers/.+\.rb})
    watch(%r{public/.+\.(css|js|html)})
    watch(%r{config/locales/.+\.yml})
    # Rails Assets Pipeline
    watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html))).*}) { |m| "/assets/#{m[3]}" }
  end

end
