package com.example.myapplication;

import android.app.Instrumentation;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class LoginActivity extends AppCompatActivity implements View.OnClickListener{

    public static final String LOGIN_URL = "http://ec2-35-167-135-10.us-west-2.compute.amazonaws.com/web/rest/user/login";
    //http://ec2-35-167-135-10.us-west-2.compute.amazonaws.com/web/rest/marks
    public static final String KEY_USERNAME="username";
    public static final String KEY_PASSWORD="password";
    public static String x="a";
    private EditText editTextUsername;
    private EditText editTextPassword;
    private Button buttonLogin;


    private String username;
    private String password;
   // public static String orgID;
    //public static String orgName;

    public JSONObject jsonObject;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login);

        editTextUsername = (EditText) findViewById(R.id.editTextUsername);
        editTextPassword = (EditText) findViewById(R.id.editTextPassword);

        buttonLogin = (Button) findViewById(R.id.buttonLogin);

        buttonLogin.setOnClickListener(this);
    }


    private void userLogin() {
        username = editTextUsername.getText().toString().trim();
        password = editTextPassword.getText().toString().trim();
        StringRequest stringRequest = new StringRequest(Request.Method.POST, LOGIN_URL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        x=response.trim();

                        try {
                            jsonObject = new JSONObject(x);
                            //System.out.println(""+x);
                            String orgID = jsonObject.getString("orgId");
                            String orgName = jsonObject.getString("orgName");
                            String role = jsonObject.getString("role");
                            switch (role) {
                                case "ROLE_STUDENT":

                                    openParent(role);
                                    break;
                                case "ROLE_PARENT":
                                    openParent(role);
                                    break;
                                default:
                                    Toast.makeText(getApplicationContext(), "Login Unsuccessful!!", Toast.LENGTH_SHORT).show();
                            }


                        } catch (JSONException e) {
                            // TODO Auto-generated catch block
                            e.printStackTrace();
                        }
                        /*if(x.equals("success")) {
                            openProfile(x);
                        }
                        else{
                            Toast.makeText(getApplicationContext(), x, Toast.LENGTH_SHORT).show();
                        }*/
                                           }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(getApplicationContext(), "No Internet Connection", Toast.LENGTH_SHORT).show();
                    }
                }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> map = new HashMap<String,String>();
                map.put(KEY_USERNAME,username);
                map.put(KEY_PASSWORD,password);
                return map;
            }
        };

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    private void openStudent(String orgName){
        Intent intent = new Intent(LoginActivity.this, ActivityUserProfile.class);
        intent.putExtra(orgName,orgName);
        startActivity(intent);
    }

    private void openParent(String role){

        Intent intent = new Intent(LoginActivity.this, ActivityParentProfile.class);
        intent.putExtra("role",role);
        startActivity(intent);

        /*Intent intent1 = new Intent(LoginActivity.this, ResultActivity.class);
        intent1.putExtra("orgName",orgName);
        startActivity(intent1);

        Intent intent2 = new Intent(LoginActivity.this, StudentActivity.class);
        intent2.putExtra("orgName",orgName);
        startActivity(intent2);

        Intent intent3 = new Intent(LoginActivity.this, AttendanceActivity.class);
        intent3.putExtra("orgName",orgName);
        startActivity(intent3);*/
    }

    @Override
    public void onClick(View v) {

        userLogin();
    }
}