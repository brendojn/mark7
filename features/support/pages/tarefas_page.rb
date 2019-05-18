class Adicionar < SitePrism::Section
  element :campo_nome, 'input[name=title]'
  element :campo_data, 'input[name=dueDate]'
  element :campo_tags, '.bootstrap-tagsinput input'
  element :botao_cadastrar, 'button[id*=submit]'
  element :alerta, '.alert-warn'

  def add_tags(tags)
    tags.each do |t|
      campo_tags.set t[:tag]
      campo_tags.send_keys :tab
    end
  end

  def cadastrar(tarefa, tags)
    campo_nome.set tarefa[:nome]
    campo_data.set tarefa[:data]
    add_tags(tags)
    botao_cadastrar.click
  end
end

class TarefasPage < SitePrism::Page
  element :painel, '#task-board'
  element :botao_novo, '#insert-button'

  element :campo_busca, '#search-input'
  element :botao_busca, '#search-button'

  elements :items, 'table tbody tr'

  def item(valor)
    find('table tbody tr', text: valor)
    end

  def busca_tr(valor)
    find('#tasks tbody tr', text: valor)
  end

  def busca(valor)
    campo_busca.set valor
    botao_busca.click
  end

  def confirma_modal
    modal.find('button', text: 'Sim').click
    end

  def nao_confirma_modal
    modal.find('button', text: 'Não, deixa queto.').click
  end

  def solicita_remocao(valor)
    tr = busca_tr(valor)
    tr.find('#delete-button').click
  end

  def modal
    find('.modal-content')
  end

  section :adicionar, Adicionar, '#add-task-view'
end

