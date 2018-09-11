package com.example.myapplication;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;

/**
 * Created by swats on 2/20/2017.
 */
public class ActivityProfessorProfile extends AppCompatActivity implements View.OnClickListener {

    private TextView marks;
    private TextView studentdetails;
    private TextView appointment;

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_professor_profile);

        marks = (TextView) findViewById(R.id.marks);
        studentdetails = (TextView) findViewById(R.id.studentdetails);
        appointment = (TextView) findViewById(R.id.appointment);

        marks.setOnClickListener(this);
        studentdetails.setOnClickListener(this);
        appointment.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        if (v == marks) {
            startActivity(new Intent(this, ResultActivity.class));
        }
        if (v == studentdetails) {
            startActivity(new Intent(this, StudentActivity.class));
        }
        if (v == appointment) {
            startActivity(new Intent(this, AppointmentActivity.class));
        }
    }
}