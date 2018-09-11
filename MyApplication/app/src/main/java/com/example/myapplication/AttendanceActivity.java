package com.example.myapplication;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
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
/**
 * Created by swats on 2/20/2017.
 */
public class AttendanceActivity extends AppCompatActivity implements View.OnClickListener{
    public static final String DATA_URL = "http://ec2-35-167-135-10.us-west-2.compute.amazonaws.com/web/rest/attendance/student/";

    public static final String KEY_ROLLNO = "rollno";
    public static final String KEY_SUB = "sub";
    public static final String KEY_W1 = "w1";
    public static final String KEY_W2 = "w2";
    public static final String KEY_W3 = "w3";
    public static final String KEY_W4 = "w4";
    public static final String KEY_W5 = "w5";
    public static final String KEY_W6 = "w6";
    public static final String KEY_W7 = "w7";
    public static final String KEY_W8 = "w8";
    public static final String KEY_W9 = "w9";
    public static final String JSON_ARRAY = "result";

    private EditText editTextId;
    private Button buttonGet;
    private TextView textViewResult;
    private TextView textView;
    private ProgressDialog loading;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_attendance);

       // textView = (TextView) findViewById(R.id.iname);

        //Intent intent3 = getIntent();

       // textView.setText("" + intent3.getStringExtra("orgName")) ;

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

        String url = DATA_URL+editTextId.getText().toString().trim();

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
                        Toast.makeText(AttendanceActivity.this,"Request Expired",Toast.LENGTH_LONG).show();
                    }
                });

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    private void showJSON(String response){

       // System.out.println(response);
        String rollno="";
        String sub= "";
        String w1= "";
        String w2= "";
        String w3= "";
        String w4= "";
        String w5= "";
        String w6= "";
        String w7= "";
        String w8= "";
        String w9= "";

        try {
            StringBuilder builder = new StringBuilder();
            JSONObject jsonObject = new JSONObject(response);
            JSONArray jsonArray = jsonObject.getJSONArray("data");

            for(int i=0; i<jsonArray.length();i++) {
                JSONObject e = jsonArray.getJSONObject(i);

                rollno = e.getString("rollno");
               //System.out.println(rollno);
                sub = e.getString("sub");
                w1 = e.getString("w1");
                w2 = e.getString("w2");
                w3 = e.getString("w3");
                w4 = e.getString("w4");
                w5 = e.getString("w5");
                w6 = e.getString("w6");
                w7 = e.getString("w7");
                w8 = e.getString("w8");
                w9 = e.getString("w9");

                builder.append("Roll Number:\t"+rollno+"\nSubject:\t" +sub+ "\nWeek 1:\t"+ w1+ "\nWeek 2:\t"+ w2+"\nWeek 3:\t"+ w3+"\nWeek 4:\t"+ w4+"\nWeek 5:\t"+ w5+"\nWeek 6:\t"+w6+"\nWeek 7:\t"+w7+"\nWeek 8:\t"+w8+"\nWeek 9:\t"+w9);
                //
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
