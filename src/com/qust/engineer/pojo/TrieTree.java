package com.qust.engineer.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.PriorityQueue;

//实现简单的搜索引擎功能
public class TrieTree implements Serializable{
	private static final long serialVersionUID = 1L;
	private TrieNode root;
	private int limit=5;
	private class TrieNode implements Serializable{
		private static final long serialVersionUID = 1L;
		char content;
		boolean isWord;
		int count;
		PriorityQueue<TrieNode> childern;
		
		public TrieNode(char c) {
			// TODO Auto-generated constructor stub
			childern=new PriorityQueue<>((n1,n2)->{if(n1.count==n2.count) return 0;else return n2.count-n1.count;});//�Ӵ�С����
			isWord=false;
			content=c;
			count=0;
		}
		
		public TrieNode find(char c) {
			if(childern!=null){
				for(TrieNode node:childern){
					if(node.content==c){
						return node;
					}
				}
			}
			return null;
		}
	}
	
	public TrieTree() {
		// TODO Auto-generated constructor stub
		root=new TrieNode(' ');
	}
	
	public void insert(String word) {
		if(search(word)) return;
		
		TrieNode current=root;
		for(int i=0;i<word.length();i++){
			TrieNode child=current.find(word.charAt(i));
			if(child!=null){
				current=child;
			}else{
				current.childern.add(new TrieNode(word.charAt(i)));
				current=current.find(word.charAt(i));
			}
			current.count++;
		}
		current.isWord=true;
	}
	
	public boolean search(String word) {
		TrieNode current=root;
		for(int i=0;i<word.length();i++){
			TrieNode tmp=current.find(word.charAt(i));
			if(tmp==null){
				//not find
				return false;
			}else{
				current=tmp;
			}
		}
		return current.isWord;
	}
	
	public void delete(String word) {
		if(!search(word)) return;
		
		TrieNode current=root;
		for(int i=0;i<word.length();i++){
			TrieNode child=current.find(word.charAt(i));
			if(child.count==1){
				current.childern.remove(child);
				return;
			}else{
				child.count--;
				current=child;
			}
		}
	}
	
	public List<String> query(String word) {
		TrieNode current=root;
		for(int i=0;i<word.length();i++){
			current=current.find(word.charAt(i));
			if(current==null){
				insert(word);
				return null;
			}
		}
		List<String> res=new ArrayList<>();
		dfs(current, res, word,"");
		return res;
	}
	
	private void dfs(TrieNode cur,List<String> result,String word,String s) {
		if(cur.childern.size()==0){
			result.add(new String(word+s));
			return;
		}
		if(cur.isWord){
			result.add(new String(word+s));
		}
		for(TrieNode node:cur.childern){
			if(result.size()>=limit) return;
			dfs(node, result,word,s+=node.content);
			s=s.substring(0,s.length()-1);
		}
	}
}
