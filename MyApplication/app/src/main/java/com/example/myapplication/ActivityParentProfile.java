package com.example.myapplication;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

/**
 * Created by swats on 2/20/2017.
 */
public class ActivityParentProfile extends AppCompatActivity implements View.OnClickListener {

    private TextView result;
    private TextView attendance;
    private TextView student;
    private TextView textView;
    private Button logout;
    //private String orgID=LoginActivity.orgID;


    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_parent_profile);

        textView = (TextView) findViewById(R.id.profilename);

        Intent intent = getIntent();

        textView.setText("" + intent.getStringExtra("role")) ;

        result = (TextView) findViewById(R.id.result);
        attendance = (TextView) findViewById(R.id.attendance);
        student = (TextView) findViewById(R.id.student);
        logout= (Button) findViewById(R.id.logout);
        result.setOnClickListener(this);
        attendance.setOnClickListener(this);
        student.setOnClickListener(this);
        logout.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        if (v == result) {
            startActivity(new Intent(this, ResultActivity.class));
        }
        if (v == attendance) {
            startActivity(new Intent(this, AttendanceActivity.class));
        }
        if (v == student) {
            startActivity(new Intent(this, StudentActivity.class));
        }
            if (v == logout) {
                startActivity(new Intent(this, MainActivity.class));
        }
    }
}