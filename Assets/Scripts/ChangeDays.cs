using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeDays : MonoBehaviour
{
    [SerializeField] float speed;
private void Start()
    {


    }
private void Update()
    {
        float val = Mathf.PingPong(speed*Time.time, 1);
        GetComponent<Renderer>().material.SetFloat("_TexValue", val);
    }
}
