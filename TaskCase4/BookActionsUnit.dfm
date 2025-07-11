inherited WebModule1: TWebModule1
  OnCreate = WebModuleCreate
  Actions = <
    item
      Default = True
      Name = 'WebActionItem1'
      PathInfo = '/'
    end>
  Height = 119
  Width = 255
  object qryGenres: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select g.genre_num_id,'
      '          g.name as genre_name'
      'from Genres g'
      'where g.active = 1'
      'order by g.name')
    Left = 24
    Top = 8
  end
  object qryAuthors: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select a.author_num_id, '
      
        '       (a.first_name + '#39' '#39' + a.last_name + + case when a.patrony' +
        'mic is not null '
      #9#9#9#9#9#9#9'    then '#39' '#39' + a.patronymic '
      #9#9#9#9#9#9#9'  else null'
      #9#9#9#9#9#9'    end) as author_name'
      'from Authors a'
      'where a.active = 1'
      'order by a.last_name')
    Left = 104
    Top = 8
  end
  object qryBooks: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select b.book_num_id,'
      #9'b.title,'
      #9'b.publication_year,'
      
        #9'(a.first_name + '#39' '#39' + a.last_name + case when a.patronymic is n' +
        'ot null '
      #9#9#9#9'                      then '#39' '#39' + a.patronymic '
      #9#9#9#9#9#9#9'else null'
      #9#9#9#9#9#9'  end) as author_name,'
      #9'g.name as genre_name'
      'from Books b,'
      '     Authors a,'
      '     Genres g'
      'where b.author_num_id = a.author_num_id'
      '  and b.genre_num_id = g.genre_num_id'
      '  and b.active = 1'
      'order by b.book_num_id')
    Left = 184
    Top = 8
  end
  object qryBookById: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    Left = 184
    Top = 64
  end
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=BookCatalogue;Data Source=localhost'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 64
  end
end
