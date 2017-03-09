namespace :importer do
  desc 'Import beers to database rake importer:beers path=/tmp/beers/'
  task :beers => :environment do
    Openbeerdb::LoaderService.new(path).load_all
  end

  def path
    ENV['path'] or fail 'path not defined'
  end
end
