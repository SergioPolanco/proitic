# Generated by Django 2.1.1 on 2018-10-02 02:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('investigator', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Grade',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('estudiante', models.CharField(max_length=100)),
                ('titulo', models.CharField(max_length=100)),
                ('fechaDefensa', models.DateField()),
                ('descripcion', models.TextField()),
                ('archivo', models.FileField(blank=True, null=True, upload_to='tesisgrade/')),
                ('slug', models.CharField(max_length=100, unique=True)),
                ('tutor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='investigator.Investigator')),
            ],
            options={
                'db_table': 'tesisgrade',
            },
        ),
        migrations.CreateModel(
            name='PosGrade',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('estudiante', models.CharField(max_length=100)),
                ('titulo', models.CharField(max_length=100)),
                ('fechaDefensa', models.DateField()),
                ('descripcion', models.TextField()),
                ('archivo', models.FileField(blank=True, null=True, upload_to='tesisposgrade/')),
                ('slug', models.CharField(max_length=100, unique=True)),
                ('tutor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='investigator.Investigator')),
            ],
            options={
                'db_table': 'tesisposgrade',
            },
        ),
    ]
