class Driver
  attr_reader :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def visit(url)
    @driver.navigate.to url
  end

  def input_by_id(id, data)
    @driver.find_element(:id, id).send_keys(data)
  end

  def click_button(class_name)
    @driver.find_element(:class, class_name).click
  end

  def fill(&block)
    instance_eval(&block) if block_given?
  end
end