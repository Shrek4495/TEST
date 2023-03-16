module ApplicationHelper
  def current_year
    Date.current.year
  end
  def flash_class_style(flash_type)
    flash_type.eql?('alert') ? 'alert-danger' : 'alert-info'
  end
  def github_url(author, repo)
    link_to 'Репозиторий проекта', "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
