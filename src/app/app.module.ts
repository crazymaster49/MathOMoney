import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import {RouterModule} from '@angular/router';
import { AppComponent } from './app.component';
import {UtilModule} from './util/util.module';
import {MetaSenderComponent} from './meta/meta-sender/meta-sender.component';
import {CommonModule} from '@angular/common';
import { HomeComponent } from './home/home.component';

@NgModule({
  declarations: [
    AppComponent,
    [MetaSenderComponent,HomeComponent]
  ],
  exports: [MetaSenderComponent],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    CommonModule,
    RouterModule.forRoot([
      {
        path: '', component: HomeComponent
      },
      {
        path: 'play',
        component: MetaSenderComponent
      }
    ]),
    UtilModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
