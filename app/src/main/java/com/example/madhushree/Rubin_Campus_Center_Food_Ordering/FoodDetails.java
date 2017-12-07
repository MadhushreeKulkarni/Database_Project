package com.example.madhushree.Rubin_Campus_Center_Food_Ordering;

/**
 * Created by Madhushree on 10/30/2017.
 */

import com.example.madhushree.Rubin_Campus_Center_Food_Ordering.constant.SQLCommand;
import com.example.madhushree.Rubin_Campus_Center_Food_Ordering.util.DBOperator;
/**import com.example.madhushree.Rubin_Campus_Center_Food_Ordering.util.Pair;
import com.example.madhushree.Rubin_Campus_Center_Food_Ordering.view.ChartGenerator; */
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;
import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class FoodDetails extends Activity implements View.OnClickListener {

    EditText Item_name_description_edit, Price_details_edit, Quantity_edit;
    Button Back_Button, backMain_Menu_Button_btn, Continue_btn;

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Item_name_description_edit = (EditText) this.findViewById(R.id.Item_name_description);
        Price_details_edit = (EditText) this.findViewById(R.id.Price_details);
        Quantity_edit = (EditText) this.findViewById(R.id.Quantity_Details);

        Button backBtn = (Button) this.findViewById(R.id.Back_Button);
        backBtn.setOnClickListener(this);
        Button mainmenuBtn = (Button) this.findViewById(R.id.Main_Menu_Button);
        mainmenuBtn.setOnClickListener(this);
        Button continueBtn = (Button) this.findViewById(R.id.Continue_btn);
        continueBtn.setOnClickListener(this);

        displayFoodDetails();
    }

    private void displayFoodDetails() {
        String f_id = getIntent().getExtras().getString("f_name");

        Log.i(f_id, "food");
        Cursor cursor = DBOperator.getInstance().execQuery(SQLCommand.QUERY_3, new String[]{f_id});
        cursor.moveToFirst();
        Log.i(cursor.getString(0), "f_id");
        Log.i(cursor.getString(1), "f_name");

        Item_name_description_edit = (EditText) this.findViewById(R.id.Item_name_description);
        Item_name_description_edit.setText(cursor.getString(1));
        Price_details_edit = (EditText) this.findViewById(R.id.Price_details);
        Price_details_edit.setText(cursor.getString(2));
        Quantity_edit = (EditText) this.findViewById(R.id.Quantity_Details);
        Quantity_edit.setText(cursor.getString(3));
    }

    @Override
    public void onClick(View view) {

    }
}