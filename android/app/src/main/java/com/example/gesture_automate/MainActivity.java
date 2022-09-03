package com.example.gesture_automate;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private InstrumentActivityListener listener;

    public void setInstrumentActivityListener(InstrumentActivityListener listener) {
        this.listener = listener;
    }

    // Generate output report when the activity is destroyed
    @Override
    public void onDestroy() {
        super.onDestroy();
        super.finish();
        if (listener != null) {
            listener.onActivityEnd();
        }
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
   }
   
