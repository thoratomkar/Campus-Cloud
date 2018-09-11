package com.example.myapplication;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ResultActivity extends AppCompatActivity implements View.OnClickListener {

    private EditText editTextId;
    private Button buttonGet;
    private TextView textViewResult;
    private TextView textView;

    private ProgressDialog loading;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result);

        //textView = (TextView) findViewById(R.id.iname);

        //Intent intent1 = getIntent();

     //   textView.setText("" + intent1.getStringExtra("orgName")) ;

        editTextId = (EditText) findViewById(R.id.editTextId);
        buttonGet = (Button) findViewById(R.id.buttonGet);
        textViewResult = (TextView) findViewById(R.id.textViewResult);

        buttonGet.setOnClickListener(this);
    }

    private void getData() {
        String id = editTextId.getText().toString().trim();
        if (id.equals("")) {
            Toast.makeText(this, "Please Enter Roll Number!", Toast.LENGTH_LONG).show();
            return;
        }
        loading = ProgressDialog.show(this,"Please wait...","Fetching...",false,false);

        String url = Config.DATA_URL+editTextId.getText().toString().trim();

        StringRequest stringRequest = new StringRequest(url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                loading.dismiss();
                showJSON(response);
            }
        },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(ResultActivity.this,"Student Does Not Exist",Toast.LENGTH_LONG).show();
                    }
                });

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    private void showJSON(String response){
       // System.out.println(response);
        String id="";
        String rollNo="";
        String sub= "";
        String fullName= "";
        String testName= "";
        String subName= "";
        String maxscore= "";
        String passscore= "";
        String score= "";
        String list= "";
        String status="";
        try {
            StringBuilder builder = new StringBuilder();
            JSONObject jsonObject = new JSONObject(response);
            JSONArray jsonArray= jsonObject.getJSONArray("list");

           for(int i=0; i<jsonArray.length();i++) {
                JSONObject e = jsonArray.getJSONObject(i);
                JSONObject subObject = e.getJSONObject("student");
                JSONObject subObject1 = e.getJSONObject("test");
                JSONObject subObject2 = subObject1.getJSONObject("subject");
                id = subObject.getString(Config.KEY_ID);
                rollNo = subObject.getString(Config.KEY_ROLLNO);
                fullName = subObject.getString(Config.KEY_FULLNAME);
                //sub = subObject2.getString(Config.KEY_SUBJECTNAME);

                testName = subObject1.getString(Config.KEY_TESTNAME);
                subName = subObject2.getString(Config.KEY_SUBJECTNAME);
                maxscore = subObject1.getString(Config.KEY_MAXSCORE);
                passscore = subObject1.getString(Config.KEY_PASSINGSCORE);
                score = e.getString(Config.KEY_SCORE);
                status = e.getString(Config.KEY_STATUS);
               builder.append("ID:\t"+id+"\nRoll No.:\t" +rollNo+  "\nName:\t"+ fullName+"\nTest:\t"+ testName+"\nSubject:\t"+ subName+"\nMax Score:\t"+ maxscore+"\nPass Score:\t"+ passscore+"\nScore:\t"+score+"\nResult:\t"+status);
                //textViewResult.setText
                //System.out.println("Id : " + i + " = " + e.getString("id"));
                //System.out.println("Roll No. : " + i + " = " + e.getString("rollno"));
                //System.out.println("Subject : " + i + " = " + e.getString("sub"));
                //System.out.println("Internals 1 : " + i + " = " + e.getString("ia1"));
                //System.out.println("Internals 2 : " + i + " = " + e.getString("ia2"));
                //System.out.println("End Sem : " + i + " = " + e.getString("es"));
                //System.out.println("Term Work : " + i + " = " + e.getString("tw"));
                //System.out.println("Practical : " + i + " = " + e.getString("pv"));
            }
            textViewResult.setText(builder.toString());
        } catch (JSONException e) {
            e.printStackTrace();
        }

    }


    @Override
    public void onClick(View v) {

        getData();
    }
}