# -*- coding: utf-8 -*-
"""
Created on Sat Jul 16 23:25:58 2016




"""
from flask import Flask, render_template, request,json
from flaskext.mysql import MySQL
#from werkzeug import generate_password_hash, check_password_hash

#Create the app
app = Flask(__name__)
mysql = MySQL()
 
# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
#app.config['MYSQL_DATABASE_PASSWORD'] = 'xxx'
app.config['MYSQL_DATABASE_PASSWORD'] = 'Hope5ful'
app.config['MYSQL_DATABASE_DB'] = 'Treasure_Hunt'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

# renders the home page of the website
@app.route("/")
def main():
    return render_template('index.html')
    


# renders the sign up page once the signup button is pressed    
@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')
    
# signs up the user
#passes on the inputed name, email and password to MySQL to add the user to the database if they haven't already used this email
@app.route('/signUp',methods=['POST'])
def signUp():
 
    try:
        
        # get the inputed values:
        _name = request.form['inputName']
        _email = request.form['inputEmail']
        _password = request.form['inputPassword']

        # validate the received values
        if _name and _email and _password:
            
            # call MySQL
            
            conn = mysql.connect()
            cursor = conn.cursor()
            # Since the hashed password was too long to be stored in the user table in the database 
            # I used the origina password for now so I commented out the hashpassword generator
            #_hashed_password = generate_password_hash(_password)
            cursor.callproc('sp_createUser',(_name,_email,_password))
            data = cursor.fetchall()

            if len(data) is 0:
                conn.commit()
                return json.dumps({'message':'User created successfully !'})
            else:
                return json.dumps({'error':str(data[0])})
        else:
            return json.dumps({'html':'<span>Enter the required fields</span>'})

    except Exception as e:
        return json.dumps({'error':str(e)})
    finally:
        # close the connection with MySQL
        cursor.close() 
        conn.close()

# renders the sign in page when the sign in button is pressed 
@app.route('/showSignIn')
def showSignIn():
    return render_template('signin.html')    


# logs in the user
# passes on the inputed email(username) and password to MySql to check if the user is signed up, 
#if they are they can go on to the next page    
@app.route('/logIn',methods= ['POST'])
def logIn():
    try:
        # get the inputed information
        _email = request.form['inputEmail']
        _password = request.form['inputPassword']
        
        # validate the received values        
        if _email and _password:
             
            #call MySQL 
             
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_checkUser',(_email,_password))
            data = cursor.fetchall()
            
            # if user valid, rendesrs next page:
            if len(data) is 0:
                conn.commit()
                return render_template('insertCode.html')
                
               
            else:
                return json.dumps({'error':str(data[0])})
                
        else:
            return json.dumps({'html':'<span>Enter the required fields</span>'})
        
    except Exception as e:
        return json.dumps({'error':str(e)})
        
    # close connection to MySQL    
    finally:
        cursor.close() 
        conn.close()
        
        
#Checks if the inputed code corresponds to the code for that location, 
# if it does, renders the next page        
@app.route('/submitCode',methods= ['POST'])
def submitCode():
    try:
        _code = request.form['inputCode']
        _location = request.form['inputLocation']
        
        if _code and _location:
                        
            
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_getEnigma',(_code,_location))
            data = cursor.fetchall()
            print data[0]

            if data[0] != (u'Wrong code inserted !',):
                return render_template('enigma1.html')
                
               
            else:
                return json.dumps({'error':str(data[0])})

                
                
        else:
            return json.dumps({'html':'<span>Enter the required fields</span>'})
        
    except Exception as e:
        return json.dumps({'error':str(e)})
    finally:
        cursor.close() 
        conn.close()
        
# Checks if the submited answer is correct and tells the user         
@app.route('/submitAnswer',methods= ['POST'])
def submitAnswer():
     
    try:
        _answer= request.form['inputAnswer']
        
        if _answer :
                        
            # All Good, let's call MySQL
            
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_checkAnswer',(_answer))
            data = cursor.fetchall()
            print data[0]

            if data[0] == (u'Correct!',):
                return render_template('correct.html')
                
               
            else:
                return render_template ('incorrect.html')
                
                
        else:
            return json.dumps({'html':'<span>Enter the required fields</span>'})
        
    except Exception as e:
        return json.dumps({'error':str(e)})
    finally:
        cursor.close() 
        conn.close()
        
    

if __name__ == "__main__":
    app.run()
