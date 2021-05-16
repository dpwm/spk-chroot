from bottle import route, run, template

@route('/hello/<name>')
def index(name):
    return template('<b>Hello {{name}}</b>!', name=name)

@route('/')
def index(name='World!'):
    return template('<b>Hello {{name}}</b>!', name=name)

run(host='127.0.0.1', port=8080)
