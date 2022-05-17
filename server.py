from bottle import Bottle, run, jinja2_template, TEMPLATE_PATH, request, HTTPResponse
import os

# TEMPLATE_PATH  -- specify path of template. Bottle will look into view folder for *.tpl files
TEMPLATE_PATH.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "view")))

app = Bottle()

@app.get('/')
def form():
    return jinja2_template('main')


@app.post('/post')
def save_form():

    # get the json data from client
    data = request.json

    print(data['name'])
    print(data['email'])
    print(data['btn_val'])
    
    return HTTPResponse(status=200)


run(app, host='localhost', port=8080, reloader=True)
