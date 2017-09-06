class ThingFactory
  DEFAULT_PARAMS = {
    title: 'Title',
    body: 'Sample body text'
  }

  def call(params = {})
    DEFAULT_PARAMS.merge!(params)
    Thing::Create.(thing: DEFAULT_PARAMS)['model']
  end
end
