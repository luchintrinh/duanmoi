#include<bits/stdc++.h>
using namespace std;
int so_pt, so_cot;
int a[100][100], c=0, dem=0;
void tinh(){
	if(so_pt%3==0) c=so_pt/3;
	else c=so_pt/3+1;
}
void nhap(){
	for(int i=0; i<c; i++){
		for(int j=0; j<so_cot; j++){
			if(dem<so_pt){
				cin>>a[i][j];
				dem++;
			}
	}
 }
}
// so phan tu: 10, so cot: 3;
void xuat(){
	for(int i=0; i<so_cot; i++){
		cout<<"a"<<" ";
	}
	cout<<endl;
	dem=0;
	for(int i=0; i<c; i++){
		for(int j=0; j<so_cot; j++){
			if(dem<so_pt){
				cout<<a[i][j]<<" ";
				dem++;
			}
			else break;
		}
		cout<<endl;
	}
}
int main(){
	cout<<" nhap vao so phan tu va so cot: ";
	cin>>so_pt>>so_cot;
	tinh();
	nhap();
	xuat();
}
