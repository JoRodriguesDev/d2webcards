# d2webcards
Este repositório contém um conjunto de classes Delphi desenvolvido para gerar cards no formato HTML. Inicialmente criado para um projeto pessoal em [D2Bridge](https://www.d2bridge.com.br/), um framework que permite compilar projetos VCL ou FireMonkey para a Web com o mesmo código.

<p align="center">
	<img src="https://agiliza.click/charts.gif">
</p>


## Instalação
Instalação usando o boss
```
boss install https://github.com/JoRodriguesDev/d2webcards
```

## Declaração
Para utilizar o d2webcards você deve adicionar as uses:
```pascal
  uModel.Dashboard.Interfaces,
  uModel.Dashboard.Factory;
```

Declarar no head do html
```html
<script src="https://cdn.jsdelivr.net/npm/countup.js@1.9.3/dist/countUp.min.js"></script>
```

## Como usar
```pascal
  var HTML := TModelDashboardFactory.New
                                    .DashboardCard
                                    .Title('Total')
                                    .Value('R$ 00,00')
                                    .UseCountUp(True)
                                    .StartValue(0)
                                    .EndValue(15188.55)
                                    .BackgroundColor(TCardColor.primary)
                                    .TextColor(TCardColor.white)
                                    .LinkText('Visualizar')
                                    .LinkUrl('#')
                                    .OnClick('{{AbreDashboard}}')
                                    .Icon('fas fa-calendar-alt feather-xl text-white icon')
                                    .Generate;
```
