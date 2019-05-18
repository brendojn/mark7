Before do
  @login_page = LoginPage.new
  @tarefas_page = TarefasPage.new
  @navbar = Navbar.new
  @dao = DAO.new

  page.current_window.resize_to(1440, 900)
end

Before('@autenticado') do
  visit '/login'
  @login_page.logar('brendo@bol.com', '123456')
  @tarefas_page.wait_for_painel
end

After('@logout') do
  @navbar.logout
end

After do |scenario|
  nome_cenario = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')
  nome_cenario = nome_cenario.tr(' ', '_').downcase!
  screenshot = "log/screenshots/#{nome_cenario}.png"
  page.save_screenshot(screenshot) # Capybara tira screenshot
  embed(screenshot, 'image/png', 'Evidência') # Cucumber anexa a evidência no relatório
end