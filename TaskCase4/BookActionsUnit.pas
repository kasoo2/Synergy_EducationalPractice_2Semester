unit BookActionsUnit;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Web.DBWeb, Web.HTTPProd, Data.DB,Web.WebReq,

  System.StrUtils, WebModuleUnit, Data.Win.ADODB;

const
  BASE_URL = '/BookCatalogueWebApp/BookCatalogue.dll/';

type
  TWebModule1 = class(TWebModule)
    qryGenres: TADOQuery;
    qryAuthors: TADOQuery;
    qryBooks: TADOQuery;
    qryBookById: TADOQuery;
    ADOConnection: TADOConnection;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModule1BooksListAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1BookEditAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1BookSaveAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1BookDeleteAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
    function GetBooksListHTML : string;
    function GetBookFormHTML(BookID : Integer = 0) : string;
  public
    { Public declarations }
  end;

var
  WebModule1 : TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

function TWebModule1.GetBooksListHTML;
var HTML: TStringList;
begin
  HTML := TStringList.Create;

  try
    HTML.Add('<!DOCTYPE html>');
    HTML.Add('<html lang="ru">');
    HTML.Add('<head>');
    HTML.Add('  <meta charset="UTF-8">');
    HTML.Add('  <meta name="viewport" content="width=device-width, initial-scale=1.0">');
    HTML.Add('  <title>Каталог книг</title>');
    HTML.Add('  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">');
    HTML.Add('</head>');
    HTML.Add('<body>');
    HTML.Add('  <div class="container mt-5">');
    HTML.Add('    <h1 class="mb-4">Каталог книг</h1>');
    HTML.Add(Format('    <a href="%sbookedit" class="btn btn-primary mb-3">Добавить книгу</a>', [BASE_URL]));
    HTML.Add('    <table class="table table-striped table-hover">');
    HTML.Add('      <thead>');
    HTML.Add('        <tr>');
    HTML.Add('          <th>ID</th>');
    HTML.Add('          <th>Название</th>');
    HTML.Add('          <th>Автор</th>');
    HTML.Add('          <th>Жанр</th>');
    HTML.Add('          <th>Год</th>');
    HTML.Add('          <th>Действия</th>');
    HTML.Add('        </tr>');
    HTML.Add('      </thead>');
    HTML.Add('      <tbody>');

    qryBooks.Open;

    while not qryBooks.Eof do
    begin
      HTML.Add(Format('        <tr>', []));
      HTML.Add(Format('          <td>%d</td>', [qryBooks.FieldByName('book_num_id').AsInteger]));
      HTML.Add(Format('          <td>%s</td>', [qryBooks.FieldByName('title').AsString]));
      HTML.Add(Format('          <td>%s</td>', [qryBooks.FieldByName('author_name').AsString]));
      HTML.Add(Format('          <td>%s</td>', [qryBooks.FieldByName('genre_name').AsString]));
      HTML.Add(Format('          <td>%d</td>', [qryBooks.FieldByName('publication_year').AsInteger]));
      HTML.Add(Format('          <td>' +
                     '<a href="%sbookedit?ID=%d" class="btn btn-sm btn-warning">Редактировать</a> ' +
                     '<a href="%sbookdelete?ID=%d" class="btn btn-sm btn-danger" onclick="return confirm(''Удалить эту книгу?'')">Удалить</a>' +
                     '</td>', [BASE_URL, qryBooks.FieldByName('book_num_id').AsInteger, BASE_URL, qryBooks.FieldByName('book_num_id').AsInteger]));
      HTML.Add('        </tr>');

      qryBooks.Next;
    end;

    HTML.Add('      </tbody>');
    HTML.Add('    </table>');
    HTML.Add('  </div>');
    HTML.Add('  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>');
    HTML.Add('</body>');
    HTML.Add('</html>');

    qryBooks.Close;

    Result := HTML.Text;
  finally
    HTML.Free;
  end;
end;

function TWebModule1.GetBookFormHTML(BookID : Integer = 0) : string;
var
  HTML: TStringList;
  Title, AuthorID, GenreID, PublicationYear, ISBN, Description: string;
begin
  if BookID > 0 then
  begin
    qryBookById.Close;
    qryBookById.SQL.Clear;
    qryBookById.SQL.Add(Format('SELECT * FROM Books WHERE book_num_id = %d', [BookID]));
    qryBookById.Open;

    if not qryBookById.IsEmpty then
    begin
      Title := qryBookById.FieldByName('title').AsString;
      AuthorID := qryBookById.FieldByName('author_num_id').AsString;
      GenreID := qryBookById.FieldByName('genre_num_id').AsString;
      PublicationYear := qryBookById.FieldByName('publication_year').AsString;
      ISBN := qryBookById.FieldByName('isbn').AsString;
      Description := qryBookById.FieldByName('description').AsString;
    end;
  end
  else
  begin
    Title := '';
    AuthorID := '';
    GenreID := '';
    PublicationYear := '';
    ISBN := '';
    Description := '';
  end;

  HTML := TStringList.Create;

  try
    HTML.Add('<!DOCTYPE html>');
    HTML.Add('<html lang="ru">');
    HTML.Add('<head>');
    HTML.Add('  <meta charset="UTF-8">');
    HTML.Add('  <meta name="viewport" content="width=device-width, initial-scale=1.0">');
    HTML.Add('  <title>Редактирование книги</title>');
    HTML.Add('  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">');
    HTML.Add('</head>');
    HTML.Add('<body>');
    HTML.Add('  <div class="container mt-5">');
    HTML.Add('    <h1 class="mb-4">' + IfThen(BookID > 0, 'Редактирование книги', 'Добавление новой книги') + '</h1>');
    HTML.Add(Format('    <form action="%sbooksave?ID=%d" method="post">', [BASE_URL, BookID]));
    HTML.Add('      <div class="mb-3">');
    HTML.Add('        <label for="title" class="form-label">Название</label>');
    HTML.Add(Format('        <input type="text" class="form-control" id="title" name="title" value="%s" required>', [Title]));
    HTML.Add('      </div>');

    HTML.Add('      <div class="mb-3">');
    HTML.Add('        <label for="author" class="form-label">Автор</label>');
    HTML.Add('        <select class="form-select" id="author" name="author" required>');

    qryAuthors.Open;

    while not qryAuthors.Eof do
    begin
      HTML.Add(Format('          <option value="%d" %s>%s</option>', [
        qryAuthors.FieldByName('author_num_id').AsInteger,
        IfThen(qryAuthors.FieldByName('author_num_id').AsString = AuthorID, 'selected', ''),
        qryAuthors.FieldByName('author_name').AsString
      ]));

      qryAuthors.Next;
    end;

    qryAuthors.Close;

    HTML.Add('        </select>');
    HTML.Add('      </div>');

    HTML.Add('      <div class="mb-3">');
    HTML.Add('        <label for="genre" class="form-label">Жанр</label>');
    HTML.Add('        <select class="form-select" id="genre" name="genre" required>');

    qryGenres.Open;

    while not qryGenres.Eof do
    begin
      HTML.Add(Format('          <option value="%d" %s>%s</option>', [
        qryGenres.FieldByName('genre_num_id').AsInteger,
        IfThen(qryGenres.FieldByName('genre_num_id').AsString = GenreID, 'selected', ''),
        qryGenres.FieldByName('genre_name').AsString
      ]));

      qryGenres.Next;
    end;

    qryGenres.Close;

    HTML.Add('        </select>');
    HTML.Add('      </div>');

    HTML.Add('      <div class="mb-3">');
    HTML.Add('        <label for="year" class="form-label">Год издания</label>');
    HTML.Add(Format('        <input type="number" class="form-control" id="year" name="year" value="%s">', [PublicationYear]));
    HTML.Add('      </div>');

    HTML.Add('      <div class="mb-3">');
    HTML.Add('        <label for="isbn" class="form-label">ISBN</label>');
    HTML.Add(Format('        <input type="text" class="form-control" id="isbn" name="isbn" value="%s">', [ISBN]));
    HTML.Add('      </div>');

    HTML.Add('      <div class="mb-3">');
    HTML.Add('        <label for="description" class="form-label">Описание</label>');
    HTML.Add(Format('        <textarea class="form-control" id="description" name="description" rows="3">%s</textarea>', [Description]));
    HTML.Add('      </div>');

    HTML.Add('      <button type="submit" class="btn btn-primary">Сохранить</button>');
    HTML.Add(Format('      <a href="%s" class="btn btn-secondary">Отмена</a>', [BASE_URL]));
    HTML.Add('    </form>');
    HTML.Add('  </div>');
    HTML.Add('  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>');
    HTML.Add('</body>');
    HTML.Add('</html>');

    Result := HTML.Text;
  finally
    HTML.Free;
  end;
end;

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := GetBooksListHTML;
  Handled := True;
end;

procedure TWebModule1.WebModule1BooksListAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := GetBooksListHTML;
  Handled := True;
end;

procedure TWebModule1.WebModule1BookEditAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  BookID: Integer;
begin
  BookID := StrToIntDef(Request.QueryFields.Values['ID'], 0);
  Response.Content := GetBookFormHTML(BookID);
  Handled := True;
end;

procedure TWebModule1.WebModule1bookSaveAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  BookID: Integer;
  SQL: string;
begin
  BookID := StrToIntDef(Request.QueryFields.Values['ID'], 0);

  if BookID > 0 then
  begin
    // Обновление существующей книги
    SQL := Format('UPDATE Books SET title = ''%s'', author_num_id = %s, genre_num_id = %s, ' +
                  'publication_year = %s, isbn = ''%s'', description = ''%s'' ' +
                  'WHERE book_num_id = %d',
                  [
                    StringReplace(Request.ContentFields.Values['title'], '''', '''''', [rfReplaceAll]),
                    Request.ContentFields.Values['author'],
                    Request.ContentFields.Values['genre'],
                    Request.ContentFields.Values['year'],
                    StringReplace(Request.ContentFields.Values['isbn'], '''', '''''', [rfReplaceAll]),
                    StringReplace(Request.ContentFields.Values['description'], '''', '''''', [rfReplaceAll]),
                    BookID
                  ]);
  end
  else
  begin
    // Добавление новой книги
    SQL := Format('INSERT INTO Books (title, author_num_id, genre_num_id, publication_year, isbn, description) ' +
                  'VALUES (''%s'', %s, %s, %s, ''%s'', ''%s'')',
                  [
                    StringReplace(Request.ContentFields.Values['title'], '''', '''''', [rfReplaceAll]),
                    Request.ContentFields.Values['author'],
                    Request.ContentFields.Values['genre'],
                    Request.ContentFields.Values['year'],
                    StringReplace(Request.ContentFields.Values['isbn'], '''', '''''', [rfReplaceAll]),
                    StringReplace(Request.ContentFields.Values['description'], '''', '''''', [rfReplaceAll])
                  ]);
  end;

  ADOConnection.Execute(SQL);

  Response.Content := Format('<!DOCTYPE html><html><head><meta http-equiv="refresh" content="0;url=%s"></head></html>', [BASE_URL]);
  Handled := True;
end;

procedure TWebModule1.WebModule1BookDeleteAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  BookID: Integer;
begin
  BookID := StrToIntDef(Request.QueryFields.Values['ID'], 0);

  if BookID > 0 then
  begin
    ADOConnection.Execute(Format('UPDATE Books SET active = 0 WHERE book_num_id = %d', [BookID]));
  end;

  Response.Content := Format('<!DOCTYPE html><html><head><meta http-equiv="refresh" content="0;url=%s"></head></html>', [BASE_URL]);
  Handled := True;
end;

procedure TWebModule1.WebModuleCreate(Sender: TObject);
begin
  inherited;

  Actions.Clear;

  // Главная страница
  with Actions.Add do
  begin
    Name := 'waDefault';
    PathInfo := '/';
    OnAction := WebModule1DefaultHandlerAction;
  end;

  // Список книг (альтернативный URL)
  with Actions.Add do
  begin
    Name := 'waBooksList';
    PathInfo := '/books';
    OnAction := WebModule1BooksListAction;
  end;

  // Редактирование книги
  with Actions.Add do
  begin
    Name := 'waBookEdit';
    PathInfo := '/bookedit';
    OnAction := WebModule1BookEditAction;
  end;

  // Сохранение книги
  with Actions.Add do
  begin
    Name := 'waBookSave';
    PathInfo := '/booksave';
    MethodType := mtPost; // Обрабатываем только POST
    OnAction := WebModule1BookSaveAction;
  end;

  // Удаление книги
  with Actions.Add do
  begin
    Name := 'waBookDelete';
    PathInfo := '/bookdelete';
    OnAction := WebModule1BookDeleteAction;
  end;
end;

initialization
  WebRequestHandler.WebModuleClass := TWebModule1;

end.
