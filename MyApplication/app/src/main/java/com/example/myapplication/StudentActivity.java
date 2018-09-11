package com.example.myapplication;
import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
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
 * Created by swats on 3/4/2017.
 */
public class StudentActivity extends AppCompatActivity implements View.OnClickListener{
    public static final String DATA_URL = "http://ec2-35-167-135-10.us-west-2.compute.amazonaws.com/web/rest/students/list/";
    public static final String KEY_ID="id";
    public static final String KEY_FULLNAME = "fullName";
    public static final String KEY_ROLLNO = "rollNo";
    public static final String KEY_COURSENAME = "name";
    public static final String KEY_BATCHNAME = "name";
    public static final String KEY_SECTIONNAME = "name";
    public static final String KEY_CONTACTNUMBER = "contactNumber";
    public static final String KEY_EMAILADDRESS = "emailAddress";
   // public static final String KEY_EMAILID = "emailid";
    public static final String JSON_ARRAY = "data";

    private EditText editTextId;
    private Button buttonGet;
    private TextView textViewResult;
    private TextView textView;
    String strParsedValue = null;
    private ProgressDialog loading;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_student);

     //   textView = (TextView) findViewById(R.id.iname);

        //Intent intent2 = getIntent();

      //  textView.setText("" + intent2.getStringExtra("orgName")) ;

        editTextId = (EditText) findViewById(R.id.editTextId);
        buttonGet = (Button) findViewById(R.id.buttonGet);
        textViewResult = (TextView) findViewById(R.id.textViewResult);

        buttonGet.setOnClickListener(this);
    }

    private void getData() {
        String id = editTextId.getText().toString().trim();
        if (id.equals("")) {
            Toast.makeText(this, "Please Enter Class ID!", Toast.LENGTH_LONG).show();
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
                        Toast.makeText(StudentActivity.this,"Request Expired",Toast.LENGTH_LONG).show();
                    }
                });

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    private void showJSON(String response){
        //System.out.println(response);
        String fullName="";
        String id="";
        String rollNo="";
        String courseName= "";
        String batchName= "";
        String sectionName= "";
        String contactNumber= "";
        String emailAddress= "";
        try {
            StringBuilder builder = new StringBuilder();
            JSONObject jsonObject = new JSONObject(response);
            JSONArray jsonArray = jsonObject.getJSONArray("data");
            for(int i=0; i<jsonArray.length();i++) {
            //    TextView textViewResult = new TextView(this);
              //  textViewResult.setTextSize(40);
                JSONObject e = jsonArray.getJSONObject(i);
                id = e.getString("id");
                fullName = e.getString("fullName");
                rollNo = e.getString("rollNo");
                contactNumber = e.getString("contactNumber");
                emailAddress = e.getString("emailAddress");
                JSONObject c= e.getJSONObject("course");

                JSONObject b= e.getJSONObject("batch");

                JSONObject s= e.getJSONObject("section");
                batchName = b.getString("name");
                //System.out.println(batchName);
                sectionName = s.getString("name");
                courseName = c.getString("name");
                builder.append("\nStudent Name:\t" + fullName + "\nStudent ID:\t"+id+"\nRoll No.:\t" + rollNo + "\nContact Number:\t" + contactNumber + "\nEmail ID:\t" + emailAddress + "\nCourse:\t" + courseName + "\nBatch:\t" + batchName + "\nSection:\t" + sectionName);


              // textViewResult.setText("\nStudent Name:\t" + fullName + "\nStudent ID:\t"+id+"\nRoll No.:\t" + rollNo + "\nContact Number:\t" + contactNumber + "\nEmail ID:\t" + emailAddress + "\nCourse:\t" + courseName + "\nBatch:\t" + batchName + "\nSection:\t" + sectionName);
                //textViewResult.setText
            }
            textViewResult.setText(builder.toString());
           //setContentView(textViewResult);
        } catch (JSONException e) {
            e.printStackTrace();
        }

    }


    @Override
    public void onClick(View v) {
        getData();
    }
}
