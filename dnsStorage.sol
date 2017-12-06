pragma solidity ^0.4.18;

import './strings.sol';

contract test {

    uint256 public ssize=0;
    struct Selling {
        uint256 data;
        string name;
    }

    struct Keys{
        Selling s;
    }
    
    using strings for *;

    string  public  allNames;
    uint256 public ii = 0;
    mapping(string => Selling) selling;
    mapping(uint256=>Keys) keys;
    string comma = ",";
    
    function setStruct(uint256 d, string _name){
        selling[_name].data=d;
        selling[_name].name=_name;
        keys[ssize].s=selling[_name];
        ssize+=1;
    }
    
    function getStructKey(uint256 index) returns (string s){
        return keys[index].s.name;
    }
    
    function getAll() returns (string allN){

        while(ii < ssize){
            string nn = keys[ii].s.name;
            allNames=strings.concat(allNames.toSlice(),nn.toSlice());
            if(ii==0){
                allNames=strings.concat(nn.toSlice(),comma.toSlice());
            }else{
                allNames=strings.concat(allNames.toSlice(),comma.toSlice());
            }
            ii+=1;
        }
        ii=0;
        return allNames;
    }
}