package com.example.gesture_automate;

public class InstrumentActivity extends MainActivity {
    public static String TAG = "InstrumentActivity";
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
}